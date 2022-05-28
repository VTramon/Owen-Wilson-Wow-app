import 'package:flutter/material.dart';
import 'package:owen_wilson/models/api.dart';
import 'package:video_viewer/video_viewer.dart';

class VideoComponent extends StatefulWidget {
  final Api api;

  const VideoComponent({Key? key, required this.api}) : super(key: key);

  @override
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  final VideoViewerController _controller = VideoViewerController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: VideoViewer(
        controller: _controller,
        onFullscreenFixLandscape: false,
        source: {
          "1080p": VideoSource(
            video: VideoPlayerController.network(
              widget.api.video!.high!,
            ),
          ),
          "720p": VideoSource(
            video: VideoPlayerController.network(
              widget.api.video!.medium!,
            ),
          ),
          "480p": VideoSource(
            video: VideoPlayerController.network(
              widget.api.video!.low!,
            ),
          ),
          "360p": VideoSource(
            video: VideoPlayerController.network(
              widget.api.video!.veryLow!,
            ),
          ),
        },
      ),
    );
  }
}
