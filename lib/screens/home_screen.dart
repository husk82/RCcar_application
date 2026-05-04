import 'package:flutter/material.dart';
import '../widgets/speed_slider.dart';
import '../widgets/status_panel.dart';
import '../widgets/control_pad.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({
    super.key
  });

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>
{
  double speed = 0.5;

  void sendCommand(String command)
  {
    print("Command: $command");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Controller"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ControlPad(sendCommand: sendCommand),

          StatusPanel(),

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
