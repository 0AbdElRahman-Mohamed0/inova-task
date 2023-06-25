import 'package:dartz/dartz.dart';
import 'package:inova_task/core/error/exceptions.dart';
import 'package:inova_task/core/error/failures.dart';
import 'package:inova_task/features/series/data/datasources/series_remote_data_source.dart';
import 'package:inova_task/features/series/domain/entities/series.dart';
import 'package:inova_task/features/series/domain/repositories/sereis_repository.dart';

class SeriesRepositoryImplementation implements SeriesRepository {
  final SeriesRemoteDataSource seriesRemoteDataSource;

  SeriesRepositoryImplementation({
    required this.seriesRemoteDataSource,
  });

  @override
  Future<Either<Failure, Series>> getSeries() async {
    try {
      final remoteSeries = await seriesRemoteDataSource.getSeries();
      return Right(remoteSeries);
    } on ServerException catch (e) {
      return Left(ServerFailure());
    }
  }
}
