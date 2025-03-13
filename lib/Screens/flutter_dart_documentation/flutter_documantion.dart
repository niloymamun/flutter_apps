import 'package:flutter/material.dart';

class FlutterDocsCategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"title": "Layout", "subtitle": "Widgets", "icon": Icons.dashboard},
    {"title": "Text", "subtitle": "Widgets", "icon": Icons.text_fields},
    {"title": "Button", "subtitle": "Widgets", "icon": Icons.smart_button},
    {"title": "Image", "subtitle": "Widgets", "icon": Icons.image},
    {"title": "Input", "subtitle": "Widgets", "icon": Icons.input},
    {"title": "Dialog", "subtitle": "Widgets", "icon": Icons.chat_bubble},
    {"title": "Navigation", "subtitle": "Widgets", "icon": Icons.navigation},
    {"title": "Container", "subtitle": "Widgets", "icon": Icons.crop_square},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          "Flutter Docs Category",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return _buildCategoryCard(
              title: categories[index]["title"]!,
              subtitle: categories[index]["subtitle"]!,
              icon: categories[index]["icon"]!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2),
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
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.blue), // Material icon
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
