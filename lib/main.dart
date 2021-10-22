import 'package:flutter/material.dart';
import 'package:scratch/home/home_screen.dart';
import 'package:scratch/screens/singin/signin_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/login': (context) => const SignInScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
