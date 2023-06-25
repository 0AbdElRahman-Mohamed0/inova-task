import 'package:inova_task/core/api/data.dart';
import 'package:inova_task/features/series/data/models/series_model.dart';

abstract class SeriesRemoteDataSource {
  Future<SeriesModel> getSeries();
}

class SeriesRemoteDataSourceImplementation implements SeriesRemoteDataSource {
  @override
  Future<SeriesModel> getSeries() async {
    final response = data;
    return SeriesModel.fromJson(response);
  }
}
