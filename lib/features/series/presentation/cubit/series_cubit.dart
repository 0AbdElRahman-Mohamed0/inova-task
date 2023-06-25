import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:inova_task/core/error/failures.dart';
import 'package:inova_task/core/usecases/usecase.dart';
import 'package:inova_task/core/utils/app_strings.dart';
import 'package:inova_task/features/series/domain/entities/series.dart';
import 'package:inova_task/features/series/domain/usecases/get_series.dart';

part 'sereis_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  final GetSereies getSereisUseCase;
  SeriesCubit({required this.getSereisUseCase}) : super(SeriesInitial());

  Future<void> getSeries() async {
    emit(SeriesIsLoading());
    Either<Failure, Series> response = await getSereisUseCase(NoParams());

    emit(
      response.fold(
        (failure) => SeriesError(msg: _getFailureMsg(failure)),
        (series) => SeriesLoaded(series: series),
      ),
    );
  }

  String _getFailureMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
