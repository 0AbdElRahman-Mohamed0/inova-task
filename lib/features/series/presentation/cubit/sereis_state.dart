part of 'series_cubit.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

class SeriesInitial extends SeriesState {}

class SeriesIsLoading extends SeriesState {}

class SeriesLoaded extends SeriesState {
  final Series series;
  const SeriesLoaded({required this.series});

  @override
  List<Object> get props => [series];
}

class SeriesError extends SeriesState {
  final String msg;
  const SeriesError({required this.msg});

  @override
  List<Object> get props => [msg];
}
