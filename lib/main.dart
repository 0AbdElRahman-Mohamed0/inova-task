import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inova_task/app.dart';
import 'package:inova_task/app_observer.dart';
import 'package:inova_task/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  Bloc.observer = AppObserver();
  runApp(const TrainingApp());
}
