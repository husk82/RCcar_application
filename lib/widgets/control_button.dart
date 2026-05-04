import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget
{
  final IconData icon;
  final String command;
  final Function(String) sendCommand;

  const ControlButton({
    super.key,
    required this.icon,
    required this.command,
    required this.sendCommand,
  });

  @override
  Widget build(BuildContext context) 
  {
     return GestureDetector(
      onTapDown: (_) => sendCommand(command),
      onTapUp: (_) => sendCommand("STOP"),
      onTapCancel: () => sendCommand("STOP"),
      child: ElevatedButton(
        onPressed: () {},
        style:  ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
        ), 
        child: Icon(icon, size: 30),
      ),
    );
  }
}