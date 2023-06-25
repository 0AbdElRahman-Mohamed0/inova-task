import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:inova_task/features/series/domain/entities/series.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class OverViewTab extends StatefulWidget {
  final Series series;
  const OverViewTab({super.key, required this.series});

  @override
  State<OverViewTab> createState() => _OverViewTabState();
}

class _OverViewTabState extends State<OverViewTab> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReadMoreText(
            widget.series.aboutSeries,
            trimLines: 4,
            colorClickableText: Colors.black,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                decoration: TextDecoration.underline),
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 20,
          ),
          ...widget.series.instructors.map(
            (instructor) => Column(
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: instructor.photo,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Instructor',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          instructor.name,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                ReadMoreText(
                  instructor.desc,
                  trimLines: 4,
                  colorClickableText: Colors.black,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Total Run Time',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_clock),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${widget.series.duration} (${widget.series.videosNum} videos)',
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Difficulty',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.series.difficulty,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Intensity',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.series.intensity,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
