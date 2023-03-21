import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:clean_arch_demo/features/favourite_quote/presentation/screens/favorutie_quote_screen.dart';
import 'package:clean_arch_demo/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = "/";
  static const String favouriteQuoteRoute = "/favouriteQuote";
}

// type =  Nameing Route
final routes = {
  Routes.initialRoute: (context) => const QuoteScreen(),
  Routes.favouriteQuoteRoute: (context) => const FavouriteQuoteScreen()
};

// type =  Generateing  Route is prefer
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((contxt) => const QuoteScreen()));

      case Routes.favouriteQuoteRoute:
        return MaterialPageRoute(
            builder: ((contxt) => const FavouriteQuoteScreen()));

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
