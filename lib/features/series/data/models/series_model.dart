import 'package:inova_task/features/series/domain/entities/series.dart';

class SeriesModel extends Series {
  const SeriesModel({
    required int id,
    required String seriesName,
    required String aboutSeries,
    required String duration,
    required String difficulty,
    required String intensity,
    required int videosNum,
    required String videoUrl,
    required List<InstructorModel> instructors,
    required List<ClassModel> classes,
    required List<CommentModel> comments,
  }) : super(
            id: id,
            seriesName: seriesName,
            aboutSeries: aboutSeries,
            duration: duration,
            difficulty: difficulty,
            intensity: intensity,
            videosNum: videosNum,
            videoUrl: videoUrl,
            instructors: instructors,
            classes: classes,
            comments: comments);

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        id: json['id'],
        seriesName: json['series_name'],
        aboutSeries: json['about_series'],
        duration: json['duration'],
        difficulty: json['difficulty'],
        intensity: json['intensity'],
        videosNum: json['videos_num'],
        videoUrl: json['video_url'],
        classes: (json['classes'] as List<Map<String, Object>>)
            .map((e) => ClassModel.fromJson(e))
            .toList(),
        instructors: (json['instructors'] as List<Map<String, Object>>)
            .map((e) => InstructorModel.fromJson(e))
            .toList(),
        comments: (json['comments'] as List<Map<String, Object>>)
            .map((e) => CommentModel.fromJson(e))
            .toList(),
        // instructors: (json['instructors'])
        //     ?.map((instructor) => Instructor.fromJson(instructor))
        //     .toList(),
        // classes: (json['classes']).map((c) => Classes.fromJson(c)).toList(),
        // comments: (json['comments'])
        //     ?.map((comment) => Comments.fromJson(comment))
        //     .toList(),
      );
}

class InstructorModel extends Instructor {
  const InstructorModel(
      {required int id,
      required String name,
      required String desc,
      required String photo})
      : super(
          id: id,
          name: name,
          desc: desc,
          photo: photo,
        );

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      InstructorModel(
        id: json['id'],
        desc: json['desc'],
        name: json['name'],
        photo: json['photo'],
      );

  @override
  List<Object?> get props => [id, name, desc, photo];
}

class ClassModel extends Classes {
  const ClassModel(
      {required int id,
      required String name,
      required String video,
      required String duration,
      required String desc})
      : super(
          id: id,
          name: name,
          video: video,
          duration: duration,
          desc: desc,
        );

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json['id'],
        name: json['name'],
        video: json['video'],
        duration: json['duration'],
        desc: json['desc'],
      );

  @override
  List<Object?> get props => [id, name, video, duration, desc];
}

class CommentModel extends Comments {
  const CommentModel(
      {required int id,
      required String userName,
      required String userImage,
      required String commentTime,
      required String seriesName,
      required String className,
      required String comment})
      : super(
          id: id,
          userName: userName,
          userImage: userImage,
          commentTime: commentTime,
          seriesName: seriesName,
          className: className,
          comment: comment,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        userName: json['user_name'],
        userImage: json['user_image'],
        commentTime: json['comment_time'],
        seriesName: json['series_name'],
        className: json['class_name'],
        comment: json['comment'],
      );

  @override
  List<Object?> get props =>
      [id, userName, userImage, commentTime, seriesName, className, comment];
}
