import 'package:flutter/material.dart';
import 'package:rccar_app/screens/debug_screen.dart';
import '../widgets/speed_slider.dart';
import '../widgets/status_panel.dart';
import '../widgets/control_pad.dart';
import '../services/socket_service.dart';
import '../services/debug_logger.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  double speed = 0.5;

  final SocketService socketService = SocketService();

  void sendCommand(String command)
  {
    socketService.send(command);
  }

  @override
  void initState() {
    super.initState();

    socketService.onConnectChanged = ()
    {
      setState(() {});
    };
  }

  @override
  void dispose()
  {
    socketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Controller"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DebugScreen(),
                )
              );
            },
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ControlPad(sendCommand: sendCommand),

          StatusPanel(
            isConnected: socketService.isConnected,
            onConnect: ()
            {
              socketService.connect();
            },
            onDisconnect: ()
            {
              socketService.disconnect();
            },
          ),

          SpeedSlider(
            speed: speed, 
            onChanged: (value) 
            {
              setState(() => speed = value);
            },
          ),
        ],
      ),
    );
  }
}
