import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget
{
  const StatusPanel({
    super.key
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
      child: const Center(
        child: Text(
          "Status",
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}