import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Welcome Back!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green)),
              const SizedBox(height: 30),
              ActionChip(
                label: const Text('Logout',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                onPressed: () {},
                backgroundColor: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
