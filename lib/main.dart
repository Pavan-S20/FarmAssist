import 'package:farm_assist/screens/aichatscreen.dart';
import 'package:farm_assist/screens/communityhelpscreen.dart';
import 'package:farm_assist/screens/diseaseoutbreakscreen.dart';
import 'package:farm_assist/screens/homescreen.dart';
import 'package:farm_assist/screens/scandetectscreen.dart';
import 'package:farm_assist/screens/splashscreen.dart';
import 'package:flutter/material.dart';

// Import Screens


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      title: 'FarmAssist', // App name
      theme: ThemeData(
        primarySwatch: Colors.green, // Primary theme color
        fontFamily: 'Poppins', // Default font
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // First screen to load
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/scan': (context) => ScanDetectScreen(),
        '/outbreak': (context) => DiseaseOutbreakScreen(),
        '/community': (context) => CommunityHelpScreen(),
        '/chat': (context) => AIChatScreen(),
      },
    );
  }
}
