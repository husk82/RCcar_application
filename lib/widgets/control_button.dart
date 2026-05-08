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
     return Listener(
      onPointerDown: (_) => sendCommand(command),
      onPointerUp: (_) => sendCommand("STOP"),
      onPointerCancel: (_) => sendCommand("STOP"),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 30),
      ),
    );
  }
}