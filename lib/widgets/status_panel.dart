import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget
{
  final bool isConnected;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;

  const StatusPanel({
    super.key,
    required this.isConnected,
    required this.onConnect,
    required this.onDisconnect, 
  });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isConnected ? "Connected" : "Disconnected",
            style: TextStyle(
              color: isConnected ? Colors.green : Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: isConnected ? onDisconnect : onConnect,
            style: ElevatedButton.styleFrom(
              backgroundColor: isConnected ? Colors.red : Colors.green,
            ), 
            child: Text(
              isConnected ? "Disconnect" : "Connect",
            ),
          ),
        ],
      ),
    );
  }
}