import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/home_screens.dart';

void main() {
  runApp(FlutterAcademyApp());
}

class FlutterAcademyApp extends StatelessWidget {
  const FlutterAcademyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
