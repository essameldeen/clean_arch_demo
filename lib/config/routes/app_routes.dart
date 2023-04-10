import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:clean_arch_demo/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_arch_demo/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:clean_arch_demo/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:clean_arch_demo/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String initialRoute = "/";
  static const String randomQuoteRoute = "/randomQuote";
}

// type =  Nameing Route
final routes = {
  Routes.initialRoute: (context) => const QuoteScreen(),
};

// type =  Generateing  Route is prefer
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (contxt) {
          return SplashScreen();
        });

      case Routes.randomQuoteRoute:
        return MaterialPageRoute(
            builder: ((contxt) => BlocProvider(
                  create: (context) =>
                      di.serviceLocator<RandomQuoteCubit>()..getRandomQuote,
                  child: const QuoteScreen(),
                )));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((contxt) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
