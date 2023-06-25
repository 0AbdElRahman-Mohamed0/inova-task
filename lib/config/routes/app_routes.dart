import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inova_task/core/utils/app_strings.dart';
import 'package:inova_task/features/series/presentation/cubit/series_cubit.dart';
import 'package:inova_task/features/series/presentation/screens/home_screen.dart';
import 'package:inova_task/injection_container.dart' as di;

class Routes {
  static const String initialRoute = '/';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return CupertinoPageRoute(builder: ((context) {
          return BlocProvider(
            create: (_) => di.sl<SeriesCubit>(),
            child: const HomeScreen(),
          );
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return CupertinoPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
