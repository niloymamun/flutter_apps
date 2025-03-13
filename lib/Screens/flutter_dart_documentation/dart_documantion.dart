import 'package:flutter/material.dart';

class DartDocsScreen extends StatefulWidget {
  @override
  _DartDocsScreenState createState() => _DartDocsScreenState();
}

class _DartDocsScreenState extends State<DartDocsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart Docs", style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.blue,
          tabs: [
            Tab(text: "Beginner"),
            Tab(text: "Intermediate"),
            Tab(text: "Expert"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BeginnerDocs(),
          Center(child: Text("Intermediate Content Coming Soon")),
          Center(child: Text("Expert Content Coming Soon")),
        ],
      ),
    );
  }
}

class BeginnerDocs extends StatelessWidget {
  final List<Map<String, String>> docs = [
    {
      "title": "Introduction to Dart",
      "subtitle": "Know and install the language",
      "id": "D1"
    },
    {
      "title": "Your First Dart Code",
      "subtitle": "YAY! First Dart program",
      "id": "D2"
    },
    {
      "title": "Comments in Dart",
      "subtitle": "Help the developers!",
      "id": "D3"
    },
    {
      "title": "Data Types",
      "subtitle": "Integer, Double but no Float!!",
      "id": "D4"
    },
    {
      "title": "Operators",
      "subtitle": "+ - * / and everything else.",
      "id": "D5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: docs.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text(
                docs[index]["id"]!,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              docs[index]["title"]!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(docs[index]["subtitle"]!),
            onTap: () {},
          ),
        );
      },
    );
  }
}
