import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RC Car App',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double speed = 0.5;

  void sendCommand(String command) {
    print("Command: $command");
    // TODO: Replace bluetooth
  }

  Widget buildControlButton(IconData icon, String command) {
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
          // LEFT side screen - Controls
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildControlButton(Icons.arrow_upward, "F"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildControlButton(Icons.arrow_back, "L"),
                  const SizedBox(width: 10),
                  buildControlButton(Icons.arrow_forward, "R"),
                ],
              ),
            const SizedBox(height: 10),
            buildControlButton(Icons.arrow_downward, "B"),
            ],
          ),
          
          // CENTER - Status/Camera
          Container(
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
          ),

          // RIGHT - Controls Panel
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Speed", style: TextStyle(fontSize: 10)),

              Slider(
                value: speed, 
                onChanged: (value) {
                  setState(() {
                    speed = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  print("Connecting....");
                },
                child: const Text("Connect"),
              ),
            ],
          ) 
        ]
      )
    );
  }
}