import 'package:get_it/get_it.dart';
import 'package:inova_task/features/series/data/datasources/series_remote_data_source.dart';
import 'package:inova_task/features/series/data/repositories/series_repository_implementation.dart';
import 'package:inova_task/features/series/domain/repositories/sereis_repository.dart';
import 'package:inova_task/features/series/domain/usecases/get_series.dart';
import 'package:inova_task/features/series/presentation/cubit/series_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  // Blocs
  sl.registerFactory(() => SeriesCubit(getSereisUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetSereies(seriesRepository: sl()));

  // Repositories
  sl.registerLazySingleton<SeriesRepository>(
      () => SeriesRepositoryImplementation(
            seriesRemoteDataSource: sl(),
          ));

  // Data Sources
  sl.registerLazySingleton<SeriesRemoteDataSource>(
      () => SeriesRemoteDataSourceImplementation());
}
