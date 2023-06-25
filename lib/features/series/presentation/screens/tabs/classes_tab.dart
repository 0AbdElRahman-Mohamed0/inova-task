import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:inova_task/features/series/domain/entities/series.dart';
import 'package:video_player/video_player.dart';

class ClassesTab extends StatefulWidget {
  final Series series;
  const ClassesTab({super.key, required this.series});

  @override
  State<ClassesTab> createState() => _ClassesTabState();
}

class _ClassesTabState extends State<ClassesTab> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  final int _currPlayIndex = 0;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.network(srcs[_currPlayIndex]);
    await _videoPlayerController1.initialize();
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
      hideControlsTimer: const Duration(seconds: 2),
      placeholder: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget _buildClass(Classes c) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Center(
                child: _chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                    ? Chewie(controller: _chewieController!)
                    : CircularProgressIndicator(
                        color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                c.id.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check),
            const SizedBox(
              width: 4,
            ),
            Text(
              c.name,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        Text(
          '(${c.duration})',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          c.desc,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.series.classes.map((c) => _buildClass(c)).toList(),
      ),
    );
  }
}
