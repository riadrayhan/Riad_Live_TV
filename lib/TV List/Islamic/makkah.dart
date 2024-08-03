import 'package:blur_container/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';


class Makkah extends StatefulWidget {
  const Makkah({super.key});

  @override
  State<Makkah> createState() => _MakkahState();
}

class _MakkahState extends State<Makkah> {



  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    WakelockPlus.enable();

    _videoPlayerController = VideoPlayerController.network(
      'http://m.live.net.sa:1935/live/quran/playlist.m3u8',
    )..initialize().then((_) {
      setState(() {});
    });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      looping: true,
      aspectRatio: _videoPlayerController.value.aspectRatio,
    );

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
    WakelockPlus.disable();
  }

  Widget circular(){
    return MultiCircularSlider(
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
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Makkah Live"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: _videoPlayerController.value.isInitialized
            ? SafeArea(
          child: SizedBox(
            width: _videoPlayerController.value.size.width,
            height: _videoPlayerController.value.size.height,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ) : Center(
          child: circular(),
        )
    );
  }
}

class MakkahCode extends StatefulWidget {
  const MakkahCode({super.key});

  @override
  State<MakkahCode> createState() => _MakkahCodeState();
}

class _MakkahCodeState extends State<MakkahCode> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 120,
          child: Image.asset('assets/button.gif',fit: BoxFit.fill,),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Makkah(),));
            });
          },
          child: Container(
            height: 80,
            width: 120,
            child: const BlurContainerWidget(
              child: Center(child: Text("Makkah Live",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)),
            ),
          ),
        ),
      ],
    );
  }
}
