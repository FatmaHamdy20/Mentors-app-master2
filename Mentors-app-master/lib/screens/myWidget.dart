import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyWidget extends StatelessWidget {
   File? imageUrl;
   File? videoUrl;
   double? h;
   double? w;
  //MyWidget({required this.imageUrl, required this.videoUrl});
   MyWidget(this.h,this.w,{this.imageUrl, this.videoUrl});
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        if (imageUrl != null)
           Image.file(
             height: h,
             width: w,
             imageUrl!,
             fit:BoxFit.cover ,
           ),


        if (videoUrl != null)
          Container(
            height: h,
            width: w,
            child: VideoPlayer(
              VideoPlayerController.file(videoUrl!),
            ),
          )

      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class MyWidget extends StatefulWidget {
//   final String? videoUrl;
//
//   MyWidget({this.videoUrl});
//
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   late VideoPlayerController _controller;
//   bool _isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.videoUrl != null) {
//       _controller = VideoPlayerController.network(widget.videoUrl!);
//       _controller.initialize().then((_) {
//         setState(() {});
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     if (_controller != null) {
//       _controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (widget.videoUrl != null && _controller.value.isInitialized)
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _isPlaying = !_isPlaying;
//                 if (_isPlaying) {
//                   _controller.play();
//                 } else {
//                   _controller.pause();
//                 }
//               });
//             },
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   VideoPlayer(_controller),
//                   if (!_isPlaying)
//                     Icon(Icons.play_circle_filled, size: 50),
//                 ],
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
