import 'package:flutter/material.dart';
import 'package:flutter_apps/Screens/coding_challange.dart';
import 'package:flutter_apps/Screens/courses_screen.dart';
import 'package:flutter_apps/Screens/interview_prep_screen.dart';
import 'package:flutter_apps/Screens/quiz_screen.dart';

import 'Video/dart_course.dart';
import 'Video/flutter_course.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> Dartmodules = [
    {
      "module": "Introduction to ",
      "lessons": [
        {
          "title": "Introduction",
          "duration": "10:00",
          "videoId": "1LBEg7pzxNo",
          "description": "Introduction to Dart programming language."
        },
        {
          "title": "Variables",
          "duration": "15:00",
          "videoId": "1LBEg7pzxNo",
          "description": "Learn about variables in Dart."
        }
      ]
    },
    {
      "module": "Advanced Dart",
      "lessons": [
        {
          "title": "Functions",
          "duration": "20:00",
          "videoId": "1LBEg7pzxNo",
          "description": "Learn about functions in Dart."
        },
        {
          "title": "Classes",
          "duration": "25:00",
          "videoId": "1LBEg7pzxNo",
          "description": "Learn about classes in Dart."
        }
      ]
    }
  ];

  final List<Map<String, dynamic>> Fluttermodules = [
    {
      "module": "Introduction to Flutter",
      "lessons": [
        {
          "title": "Introduction",
          "duration": "10:00",
          "videoId": "EIqgdhCNfXc",
          "description": "Introduction to Flutter framework."
        },
        {
          "title": "Widgets",
          "duration": "15:00",
          "videoId": "EIqgdhCNfXc",
          "description": "Learn about widgets in Flutter."
        }
      ]
    },
    {
      "module": "Advanced Flutter",
      "lessons": [
        {
          "title": "State Management",
          "duration": "20:00",
          "videoId": "EIqgdhCNfXc",
          "description": "Learn about state management in Flutter."
        },
        {
          "title": "Animations",
          "duration": "25:00",
          "videoId": "EIqgdhCNfXc",
          "description": "Learn about animations in Flutter."
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          "ফ্লাটার একাডেমি",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.light_mode, color: Colors.white),
            onPressed: () {},
          ),
          SizedBox(width: 8),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("ডকুমেন্টেশন"),
            Row(
              children: [
                Expanded(
                  child: _buildOutlinedCard(
                    context: context,
                    title: "ফ্লাটার",
                    subtitle: "ডকুমেন্টেশন",
                    icon: 'images/flutter_logo.png',
                    color: Colors.blue,
                    iconSize: 50,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FlutterCourse(Fluttermodules: Fluttermodules),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildOutlinedCard(
                    context: context,
                    title: "ডার্ট",
                    subtitle: "ডকুমেন্টেশন",
                    icon: 'images/Dart_logo.png',
                    color: Colors.purple,
                    iconSize: 50,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DartCourse(Dartmodules: Dartmodules),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            _buildSectionTitle("কমিউনিটি"),
            _buildCard(
              context: context,
              icon: 'images/community.png',
              title: "বাংলাদেশ কমিউনিটি",
              subtitle: "ফ্লাটার ডেভেলপারদের সাথে যোগাযোগ করুন।",
              color: Colors.yellow,
              iconSize: 90,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityPage(),
                  ),
                );
              },
            ),
            _buildSectionTitle("ফ্লাটার ও ডার্ট কোর্স"),
            _buildCard(
              context: context,
              icon: 'images/course.png',
              title: "ভিডিও কোর্স",
              subtitle: "ভিডিও টিউটোরিয়াল দেখে ফ্লাটার প্র্যাকটিস করুন",
              color: Colors.red,
              iconSize: 90,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoCoursesPage(
                      dartModules: Dartmodules,
                      flutterModules: Fluttermodules,
                    ),
                  ),
                );
              },
            ),
            _buildSectionTitle("প্রবলেম সলভিং"),
            _buildCard(
              context: context,
              icon: 'images/quiz.png',
              title: "কোডিং চ্যালেঞ্জ",
              subtitle: "হয়ে উঠুন দক্ষ প্রবলেম সলভার",
              color: Colors.orange,
              iconSize: 90,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CodingChallengesPage(),
                  ),
                );
              },
            ),
            Divider(height: 24, thickness: 1, color: Colors.grey[300]),
            _buildSectionTitle("কুইজ"),
            _buildCard(
              context: context,
              icon: 'images/problemsolving.webp',
              title: "ফ্লাটার এবং ডার্ট কুইজ",
              subtitle: "নিজেকে যাচাই করুন",
              color: Colors.orange,
              iconSize: 90,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(),
                  ),
                );
              },
            ),
            _buildSectionTitle("ইন্টারভিউ প্রস্তুতি"),
            _buildCard(
              context: context,
              icon: 'images/interview.png',
              title: "ইন্টারভিউ প্রস্তুতি",
              subtitle: "ইন্টারভিউ এর জন্য নিজেকে প্রস্তুত করুন",
              color: Colors.orange,
              iconSize: 90,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InterviewPreparationPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
                SizedBox(height: 10),
                Text(
                  "John Doe",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "johndoe@example.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text("হোম"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.group, color: Colors.green),
            title: Text("কমিউনিটি"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library, color: Colors.red),
            title: Text("ভিডিও কোর্স"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoCoursesPage(
                    dartModules: Dartmodules,
                    flutterModules: Fluttermodules,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.quiz, color: Colors.purple),
            title: Text("কুইজ"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.work, color: Colors.teal),
            title: Text("ইন্টারভিউ প্রস্তুতি"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InterviewPreparationPage()),
              );
            },
          ),
          Divider(height: 20, thickness: 1, color: Colors.grey[300]),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text("সেটিংস"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("লগ আউট"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
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

  Widget _buildOutlinedCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String icon,
    required Color color,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          children: [
            Image.asset(
              icon,
              width: iconSize,
              height: iconSize,
            ),
            SizedBox(height: 12),
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
    );
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("কমিউনিটি"),
      ),
      body: Center(
        child: Text("কমিউনিটি পৃষ্ঠা"),
      ),
    );
  }
}
