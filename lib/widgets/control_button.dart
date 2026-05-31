import 'package:flutter/material.dart';
import 'dart:async';

class ControlButton extends StatefulWidget
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
  State<ControlButton> createState() => _ControlButtonState();

}

class _ControlButtonState extends State<ControlButton>
{
  double opacity = 0.5;
  Timer? _holdTimer;

  @override
  Widget build(BuildContext context) 
  {
    return Listener(
    onPointerDown: (_) 
      {
        setState(() => opacity = 1.0);
        widget.sendCommand(widget.command);

        _holdTimer = Timer.periodic(Duration(milliseconds: 100), (_) {
          widget.sendCommand(widget.command);
        });
      },
      onPointerUp: (_)
      {
        _holdTimer?.cancel();
        _holdTimer = null;

        setState(() => opacity = 0.5);
        widget.sendCommand("S");
      },
      onPointerCancel: (_)
      {
        _holdTimer?.cancel();
        _holdTimer = null;

        setState(() => opacity = 0.5);
        widget.sendCommand("S");
      },
      child: AnimatedOpacity(
        opacity: opacity, 
        duration: const Duration(microseconds: 120),
        child: Container(
            padding:  const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              widget.icon,
              size: 20,
              color: Colors.white,
            ),
        ),
      ),
    );
  }
}