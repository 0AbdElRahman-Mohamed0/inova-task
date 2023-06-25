import 'package:flutter/material.dart';
import 'package:inova_task/config/routes/app_routes.dart';
import 'package:inova_task/core/utils/app_strings.dart';

class TrainingApp extends StatelessWidget {
  const TrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
