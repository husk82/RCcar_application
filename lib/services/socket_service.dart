import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'debug_logger.dart';

class SocketService 
{
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  Timer? _connectionTimer;

  VoidCallback? onConnectChanged;

  // Connect to ESP32
  void connect()
  {
    try
    {
      debugLogger.log("[Info] Connecting to ESP32...");

      _channel = WebSocketChannel.connect(
        Uri.parse('ws://192.168.4.1/ws'),
      );

      timeoutCounter();

      _subscription?.cancel();

      //Listen to server
      _subscription = _channel!.stream.listen(
        (message) 
        {

          _connectionTimer?.cancel();

          debugLogger.log("[STREAM RECV] $message");

          if(!_isConnected)
          {
            _isConnected = true;
            onConnectChanged?.call();
            debugLogger.log("[CONNECTED TO RC CAR NETWORK]");
          }
        },

        onError: (error) 
        {
          debugLogger.log("[STREAM ERROR] $error");
          _isConnected = false;
          onConnectChanged?.call();
        },

        onDone: ()
        {
           debugLogger.log("[STREAM DISCONNECTED]");
          _isConnected = false;
          onConnectChanged?.call();
        }
      );
      
    }
    catch(e)
    {
      debugLogger.log("[SOCKET ERROR] $e");
      _isConnected = false;
    }
  }

  // Send command
  void send (String message)
  {
    if (_channel != null && _isConnected)
    {
      _channel!.sink.add(message);
      debugLogger.log("[SEND] $message");
    }
    else
    {
      debugLogger.log("[FAILED SENDING MESSAGE]");
    }
  }

  // Disconnect
  void disconnect()
  {
    _connectionTimer?.cancel();
    _subscription?.cancel();
    _channel?.sink.close();
    _isConnected = false;
    onConnectChanged?.call();
    debugLogger.log("[SERVICE DISCONNECTED]");
  }  

  // Timer for Connection
  void timeoutCounter()
  {
    _connectionTimer = Timer(
      const Duration(seconds: 8),
      ()
      {
        if(!_isConnected)
        {
          debugLogger.log("[TIMEOUT] Connection failed");
          disconnect();
        }
      }
    );
  }
  
}