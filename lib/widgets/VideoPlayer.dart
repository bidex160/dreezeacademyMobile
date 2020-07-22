import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayer extends StatefulWidget {
  final bool looping;
  final VideoPlayerController videoPlayerController;
  final bool autoplay;
  final String videourl;

  ChewiePlayer(this.looping, this.videoPlayerController,this.autoplay,this.videourl );
  @override
  _ChewiePlayerState createState() => _ChewiePlayerState();
}

class _ChewiePlayerState extends State<ChewiePlayer> {
  ChewieController chewieController;
  @override
  void initState() {
   // widget.videoPlayerController.addListener(checkVideo);
   chewieController = ChewieController(
     videoPlayerController: widget.videoPlayerController,
     aspectRatio: 16/9,
     looping: false,
     allowFullScreen: true,
     allowMuting: true,
     autoInitialize: true,
     autoPlay: true,
     errorBuilder: (context, errorMessage) {
       return Center(
         child: Text(
           errorMessage,
           style: TextStyle(color: Colors.white),
         ),
       );
     },
   );
    super.initState();
  }

//  void checkVideo(){
//    print("Listernnnnnnnnnnnnwwwwwwwwwwwwwwwwwwwwww");
//    print(widget.videoPlayerController.value.position);
//    print(widget.videoPlayerController.value.duration);
//    if (widget.videoPlayerController.value.position ==
//        widget.videoPlayerController.value.duration) {
//      print('video Endedwwwwwwwwwwwwww Endeddddddddddddddddddddddddd');
//    }else{
//      print("bppppppppppppppp");
//    }
//
////    widget.videoPlayerController.addListener(() {
////
////    });
//
//  }

  @override
  void dispose() {

    widget.videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
   //print("neeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeww");
     //print(widget.videoPlayerController.position.then((value) => value));

    return Chewie(
      controller: chewieController,
    );
  }



}
