import 'package:flutter/material.dart';
import 'package:flutter_apps/Screens/Video/video_player.dart';

class FlutterCourse extends StatelessWidget {
  final List<Map<String, dynamic>> Fluttermodules;

  FlutterCourse({required this.Fluttermodules});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.deepPurple,
          secondary: Colors.amber,
          surface: Colors.white,
        ),
        fontFamily: 'Inter',
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: AnimatedOpacity(
              opacity: 1,
              duration: Duration(milliseconds: 300),
              child: Text(
                "Flutter Mastery Course",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: Colors.white),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.search_rounded),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: LessonSearchDelegate(Fluttermodules),
                  );
                },
              ),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _buildHeaderImage(),
              ),
            ],
            body: Column(
              children: [
                _buildCourseHeader(),
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    children: [
                      LessonList(Fluttermodules: Fluttermodules),
                      _buildDescriptionTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Stack(
      children: [
        Image.asset(
          "images/fluttercourse.webp",
          fit: BoxFit.cover,
          height: 280,
          width: double.infinity,
        ),
        Container(
          height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.withOpacity(0.8),
                Colors.transparent,
                Colors.deepPurple.withOpacity(0.8)
              ],
              stops: [0.0, 0.5, 1.0],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Chip(
                label: Text("Beginner Friendly"),
                backgroundColor: Colors.amber.withOpacity(0.2),
                shape: StadiumBorder(),
              ),
              SizedBox(width: 8),
              Chip(
                label: Text("6h 30min"),
                avatar: Icon(Icons.access_time, size: 18),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/instructorphoto.jpg"),
                radius: 20,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Neloy Mamun",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Software Engineer NIPRO JMI PHARMA LTD",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.list_alt, size: 24),
            text: "Curriculum",
          ),
          Tab(
            icon: Icon(Icons.description, size: 24),
            text: "Details",
          ),
        ],
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'YourCustomFont', // Replace with your custom font
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontFamily: 'YourCustomFont', // Replace with your custom font
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(4),
        splashBorderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Course Description",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.stars_rounded,
            title: "What You'll Learn",
            children: [
              "✓ Master Dart programming fundamentals",
              "✓ Understand OOP concepts in Dart",
              "✓ Asynchronous programming with Futures/Streams",
              "✓ Build real-world applications",
            ],
          ),
          SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.assignment,
            title: "Requirements",
            children: [
              "Basic programming knowledge",
              "Windows/Mac/Linux PC",
              "Dart SDK installed",
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required List<String> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.amber),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...children.map((text) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(width: 32),
                    Expanded(child: Text(text)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class LessonList extends StatelessWidget {
  final List<Map<String, dynamic>> Fluttermodules;

  LessonList({required this.Fluttermodules});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: Fluttermodules.length,
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemBuilder: (context, moduleIndex) {
        var module = Fluttermodules[moduleIndex];
        return Material(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          elevation: 2,
          child: ExpansionTile(
            title: Row(
              children: [
                Icon(Icons.library_books, color: Colors.deepPurple),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    module["module"],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Chip(
                  label: Text("${module["lessons"].length} lessons"),
                  backgroundColor: Colors.deepPurple.withOpacity(0.1),
                ),
              ],
            ),
            childrenPadding: EdgeInsets.only(left: 24),
            collapsedIconColor: Colors.grey,
            iconColor: Colors.deepPurple,
            children: module["lessons"].map<Widget>((lesson) {
              return LessonTile(
                title: lesson["title"],
                duration: lesson["duration"],
                completed: lesson["completed"] ?? false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                        videoId: lesson["videoId"],
                        title: lesson["title"],
                        description: lesson["description"],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class LessonTile extends StatelessWidget {
  final String title;
  final String duration;
  final bool completed;
  final VoidCallback onTap;

  const LessonTile({
    required this.title,
    required this.duration,
    this.completed = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: completed ? Colors.amber : Colors.deepPurple.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          completed ? Icons.check : Icons.play_arrow_rounded,
          color: completed ? Colors.white : Colors.deepPurple,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          decoration: completed ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(duration),
      trailing: Icon(Icons.lock_open_rounded, color: Colors.grey),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class LessonSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> modules;

  LessonSearchDelegate(this.modules);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.grey[700]),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.grey[700]),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _searchLessons(query);
    return _buildSearchResults(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _searchLessons(query);
    return _buildSearchResults(suggestions);
  }

  List<Map<String, dynamic>> _searchLessons(String query) {
    if (query.isEmpty) return [];

    final results = <Map<String, dynamic>>[];
    for (var module in modules) {
      for (var lesson in module["lessons"]) {
        if (lesson["title"].toLowerCase().contains(query.toLowerCase())) {
          results.add(lesson);
        }
      }
    }
    return results;
  }

  Widget _buildSearchResults(List<Map<String, dynamic>> results) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final lesson = results[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.deepPurple,
              ),
            ),
            title: Text(
              lesson["title"],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              lesson["duration"],
              style: TextStyle(color: Colors.grey[700]),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[700],
              size: 20,
            ),
            onTap: () {
              close(context, '');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoId: lesson["videoId"],
                    title: lesson["title"],
                    description: lesson["description"],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey[700]),
        border: InputBorder.none,
      ),
    );
  }
}
