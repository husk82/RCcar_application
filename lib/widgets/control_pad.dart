import 'package:flutter/material.dart';
import 'control_button.dart';

class ControlPad extends StatelessWidget
{
  final Function(String) sendCommand;

  const ControlPad(
    {
      super.key,
      required this.sendCommand,
    });

  @override
  Widget build(BuildContext context) 
  {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children:[
        ControlButton(
          icon: Icons.arrow_upward,
          command: "F",
          sendCommand: sendCommand,
        ),
        const SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControlButton(
              icon: Icons.arrow_back, 
              command: "L", 
              sendCommand: sendCommand,
            ),
            const SizedBox(width: 10),
            ControlButton(
              icon: Icons.arrow_forward, 
              command: "R", 
              sendCommand: sendCommand
            ),
          ],
        ),
        const SizedBox(height: 10),
        ControlButton(
          icon: Icons.arrow_downward, 
          command: "B", 
          sendCommand: sendCommand,
        ),
      ],
    );
  }
}