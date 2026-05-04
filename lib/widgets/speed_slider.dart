import 'package:flutter/material.dart';

class SpeedSlider extends StatelessWidget
{
  final double speed;
  final ValueChanged<double> onChanged;

  const SpeedSlider({
    super.key,
    required this.speed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Speed",
          style: TextStyle(fontSize: 10),
        ),
        Slider(
          value: speed, 
          onChanged: onChanged
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: ()
          {
            print("Connecting...");  
          }, 
          child: const Text("Connet"),
        ),
      ],
    );
  }
}