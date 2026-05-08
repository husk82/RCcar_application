import 'dart:async';

class DebugLogger 
{
  // Private constructor
  DebugLogger._internal();
  // Single shared instance
  static final DebugLogger _instance = DebugLogger._internal();
  // factory returns same instance every time
  factory DebugLogger() => _instance;

  final List<String> _logs = [];

  // stream for UI
  final StreamController<List<String>> _controller = StreamController<List<String>>.broadcast();

  Stream<List<String>> get stream => _controller.stream;

  List<String> get logs => List.unmodifiable(_logs);

  void log(String message)
  {
    _logs.add(message);

    if (_logs.length > 8)
    {
      _logs.removeAt(0);
    }

    _controller.add(_logs);
  }

  void dispose()
  {
    _controller.close();
  }
}

final debugLogger = DebugLogger();