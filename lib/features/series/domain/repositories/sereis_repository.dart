import 'package:dartz/dartz.dart';
import 'package:inova_task/core/error/failures.dart';
import 'package:inova_task/features/series/domain/entities/series.dart';

abstract class SeriesRepository {
  Future<Either<Failure, Series>> getSeries();
}
