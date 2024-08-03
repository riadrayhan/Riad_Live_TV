import 'package:blur_container/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Madina extends StatefulWidget {
  const Madina({super.key});

  @override
  State<Madina> createState() => _MadinaState();
}

class _MadinaState extends State<Madina> {

  late YoutubePlayerController _controller;
  bool _isFullscreen = false;
  bool _isLoading = true; // Track whether the video is loading

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/Kt7hKHlArl8')!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
      ),
    )..addListener(() {
      if (_controller.value.isFullScreen != _isFullscreen) {
        setState(() {
          _isFullscreen = _controller.value.isFullScreen;
        });
      }
      // Check if the video is buffering/loading
      if (_controller.value.isReady && _isLoading) {
        setState(() {
          _isLoading = false; // Video has finished loading
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !_isFullscreen
          ? AppBar(
        backgroundColor: Colors.blue,
        title: Text("Medina Live"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
          : null,
      body: Padding(
        padding: _isFullscreen ? EdgeInsets.zero : const EdgeInsets.only(top: 32.0),
        child: Stack(
          children: [
            // YouTube Player
            YoutubePlayer(
              controller: _controller,
              onReady: () {
                setState(() {
                  _isLoading = false; // Ensure loading is updated when player is ready
                });
                print('Video is ready');
              },
            ),
            // MultiCircularSlider overlay
            if (_isLoading)
              Container(

                  child: MultiCircularSlider(
                    size: MediaQuery.of(context).size.width * 0.8,
                    progressBarType: MultiCircularSliderType.circular,
                    values: const [0.2, 0.1, 0.3, 0.28],
                    colors: const [Color(0xFFFD1960), Color(0xFF29D3E8), Color(0xFF18C737), Color(0xFFFFCC05)],
                    showTotalPercentage: true,
                    label: 'Please wait\nvideo loading...',
                    animationDuration: const Duration(milliseconds: 10000),
                    trackColor: Colors.white,
                    progressBarWidth: 36.0,
                    trackWidth: 36.0,
                    labelTextStyle: const TextStyle(),
                    percentageTextStyle: const TextStyle(),
                  ),
                ),
            
            // Controls
            // if (!_isFullscreen)
            //   Positioned(
            //     bottom: 20,
            //     left: 20,
            //     child: Row(
            //       children: [
            //
            //         IconButton(
            //           icon: Icon(
            //             _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
            //             color: Colors.white,
            //             size: 40.0,
            //           ),
            //           onPressed: () {
            //             setState(() {
            //               _isFullscreen = !_isFullscreen;
            //               _controller.toggleFullScreenMode();
            //             });
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}


class MadinaCode extends StatefulWidget {
  const MadinaCode({super.key});

  @override
  State<MadinaCode> createState() => _MadinaCodeState();
}

class _MadinaCodeState extends State<MadinaCode> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 120,
          child: Image.asset(
            'assets/button.gif',
            fit: BoxFit.fill,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Madina(),
                  ));
            });
          },
          child: Container(
            height: 80,
            width: 120,
            child: const BlurContainerWidget(
              child: Center(
                  child: Text(
                "Madina Live",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
