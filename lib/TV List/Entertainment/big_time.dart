import 'package:blur_container/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';


class BigTime extends StatefulWidget {
  const BigTime({super.key});

  @override
  State<BigTime> createState() => _BigTimeState();
}

class _BigTimeState extends State<BigTime> {



  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    WakelockPlus.enable();

    _videoPlayerController = VideoPlayerController.network(
      'https://thekhayal-prod-dub-ak.akamaized.net/out/v1/8efc05177763445bb7628174ca3c6454/index_3.m3u8',
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
          title: Text("Big Time"),
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

class BigTime_Code extends StatefulWidget {
  const BigTime_Code({super.key});

  @override
  State<BigTime_Code> createState() => _BigTime_CodeState();
}

class _BigTime_CodeState extends State<BigTime_Code> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => BigTime(),));
            });
          },
          child: Container(
            height: 80,
            width: 120,
            child: const BlurContainerWidget(
              child: Center(child: Text("Big Time",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)),
            ),
          ),
        ),
      ],
    );
  }
}
