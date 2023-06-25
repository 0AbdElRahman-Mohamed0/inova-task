import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final int id;
  final String seriesName;
  final String aboutSeries;
  final String duration;
  final String difficulty;
  final String intensity;
  final int videosNum;
  final String videoUrl;
  final List<Instructor> instructors;
  final List<Classes> classes;
  final List<Comments> comments;

  const Series(
      {required this.id,
      required this.seriesName,
      required this.aboutSeries,
      required this.duration,
      required this.difficulty,
      required this.intensity,
      required this.videosNum,
      required this.videoUrl,
      required this.instructors,
      required this.classes,
      required this.comments});

  @override
  List<Object?> get props => [
        id,
        seriesName,
        aboutSeries,
        duration,
        difficulty,
        intensity,
        videosNum,
        videoUrl,
        instructors,
        classes,
        comments
      ];
}

class Instructor extends Equatable {
  final int id;
  final String name;
  final String desc;
  final String photo;

  const Instructor(
      {required this.id,
      required this.name,
      required this.desc,
      required this.photo});

  @override
  List<Object?> get props => [id, name, desc, photo];
}

class Classes extends Equatable {
  final int id;
  final String name;
  final String video;
  final String duration;
  final String desc;

  const Classes(
      {required this.id,
      required this.name,
      required this.video,
      required this.duration,
      required this.desc});

  @override
  List<Object?> get props => [id, name, video, duration, desc];
}

class Comments extends Equatable {
  final int id;
  final String userName;
  final String userImage;
  final String commentTime;
  final String seriesName;
  final String className;
  final String comment;

  const Comments(
      {required this.id,
      required this.userName,
      required this.userImage,
      required this.commentTime,
      required this.seriesName,
      required this.className,
      required this.comment});
  @override
  List<Object?> get props =>
      [id, userName, userImage, commentTime, seriesName, className, comment];
}
