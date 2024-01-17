// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:clase10/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Column(
          children: [
            Icon(
              Icons.edit,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Flutter',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
