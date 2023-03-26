// A widget that displays the picture taken by the user.
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pagination_exp/screens/results_page.dart';
import 'package:video_player/video_player.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final String filePath;
  const DisplayPictureScreen(
      {super.key, required this.imagePath, required this.filePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  late VideoPlayerController _videoPlayerController;

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    navigate();
  }

  bool isPlaying = true;
  navigate() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ResultsPage(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture or Video')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Stack(
        children: [
          widget.filePath.isEmpty
              ? Center(child: Image.file(File(widget.imagePath)))
              : FutureBuilder(
                  future: _initVideoPlayer(),
                  builder: (context, state) {
                    if (state.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                          height: size.height * 0.7,
                          child: Stack(
                            children: [
                              VideoPlayer(_videoPlayerController),
                              Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                    onPressed: () async {
                                      if (isPlaying) {
                                        await _videoPlayerController.pause();
                                        setState(() {
                                          isPlaying = false;
                                        });
                                      } else {
                                        await _videoPlayerController.play();
                                        setState(() {
                                          isPlaying = true;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 50,
                                    )),
                              ),
                            ],
                          ));
                    }
                  },
                ),

          // progress indicator
          const Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator.adaptive(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
