import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inova_task/features/series/domain/entities/series.dart';

class CommunityTab extends StatefulWidget {
  final Series series;
  const CommunityTab({super.key, required this.series});

  @override
  State<CommunityTab> createState() => _CommunityTabState();
}

class _CommunityTabState extends State<CommunityTab> {
  Widget _buildComment(Comments comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: comment.userImage,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.userName,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  comment.commentTime,
                  style: const TextStyle(fontSize: 8, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${comment.className} ',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const TextSpan(
                text: 'For 29:05',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
        Text(
          comment.seriesName,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          comment.comment,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Icon(Icons.star_border),
            SizedBox(
              width: 4,
            ),
            Text(
              'be the first to like this',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        const TextField(
          decoration: InputDecoration(hintText: 'write a comment'),
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
        children: widget.series.comments
            .map((comment) => _buildComment(comment))
            .toList(),
      ),
    );
  }
}
