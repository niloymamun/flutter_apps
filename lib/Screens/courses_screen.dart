import 'package:flutter/material.dart';

import 'Video/dart_course.dart';
import 'Video/flutter_course.dart';

class VideoCoursesPage extends StatelessWidget {
  final List<Map<String, dynamic>> flutterModules;
  final List<Map<String, dynamic>> dartModules;

  VideoCoursesPage({
    required this.flutterModules,
    required this.dartModules,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tutorials",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back arrow icon color to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(
              context: context,
              icon: 'images/flutter_logo.png',
              title: 'Flutter Tutorial',
              subtitle: 'Learn Flutter step by step.',
              color: Colors.blue,
              iconSize: 50,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FlutterCourse(Fluttermodules: flutterModules),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            _buildCard(
              context: context,
              icon: 'images/Dart_logo.png',
              title: 'Dart Tutorial',
              subtitle: 'Master Dart for Flutter development.',
              color: Colors.cyan,
              iconSize: 50,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DartCourse(Dartmodules: dartModules),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String icon,
    required String title,
    required String subtitle,
    required Color color,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: iconSize,
              height: iconSize,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[700]),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
