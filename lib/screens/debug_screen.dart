import 'package:flutter/material.dart';
import '../services/debug_logger.dart';

class DebugScreen extends StatelessWidget
{
  const DebugScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Debug Console")),
      body: StreamBuilder<List<String>>(
        stream: debugLogger.stream,
        initialData: debugLogger.logs, 
        builder: (context, snapshot)
        {
          final logs = snapshot.data ?? [];
          return ListView.builder(
            itemCount: logs.length,
            itemBuilder: (context, index)
            {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  logs[index],
                  style: const TextStyle(fontFamily: "monospace"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}