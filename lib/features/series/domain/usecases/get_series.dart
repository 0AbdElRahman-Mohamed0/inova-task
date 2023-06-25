import 'package:dartz/dartz.dart';
import 'package:inova_task/core/error/failures.dart';
import 'package:inova_task/core/usecases/usecase.dart';
import 'package:inova_task/features/series/domain/entities/series.dart';
import 'package:inova_task/features/series/domain/repositories/sereis_repository.dart';

class GetSereies implements UseCase<Series, NoParams> {
  final SeriesRepository seriesRepository;

  GetSereies({required this.seriesRepository});
  @override
  Future<Either<Failure, Series>> call(NoParams params) {
    return seriesRepository.getSeries();
  }
}
