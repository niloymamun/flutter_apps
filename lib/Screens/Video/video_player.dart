import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final String title;
  final String description;

  VideoPlayerScreen({
    required this.videoId,
    required this.title,
    required this.description,
  });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  bool _isMuted = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        enableCaption: false,
      ),
    )..addListener(() {
        if (_controller.value.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error loading video')),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen ? null : _buildAppBar(context),
      body: OrientationBuilder(
        builder: (context, orientation) {
          _isFullScreen = orientation == Orientation.landscape;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[50]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: _isFullScreen
                ? _buildLandscapeLayout()
                : _buildPortraitLayout(),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(
            _isMuted ? Icons.volume_off : Icons.volume_up_rounded,
            color: Colors.white,
          ),
          onPressed: _toggleMute,
        ),
      ],
    );
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _isMuted ? _controller.mute() : _controller.unMute();
    });
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        _buildVideoPlayer(),
        _buildDescriptionSection(),
      ],
    );
  }

  Widget _buildVideoPlayer() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(
            playedColor: Colors.indigo,
            handleColor: Colors.indigoAccent,
            backgroundColor: Colors.grey[300]!,
            bufferedColor: Colors.grey[200]!,
          ),
          onReady: () => setState(() {}),
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            Divider(height: 1, color: Colors.grey[200]),
            SizedBox(height: 20),
            Text(
              "Lesson Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.indigo[800],
              ),
            ),
            SizedBox(height: 12),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Stack(
      children: [
        YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(
            playedColor: Colors.indigo,
            handleColor: Colors.indigoAccent,
            backgroundColor: Colors.grey[300]!,
            bufferedColor: Colors.grey[200]!,
          ),
          onReady: () => setState(() {}),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: _setPortraitOrientation,
          ),
        ),
      ],
    );
  }

  void _setPortraitOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}
