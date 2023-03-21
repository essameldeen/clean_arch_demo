import 'package:clean_arch_demo/config/routes/app_routes.dart';
import 'package:clean_arch_demo/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          // type = Anonums routing
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => FavouriteQuoteScreen()));

          Navigator.pushNamed(context, Routes.favouriteQuoteRoute);
        },
        child: Center(
          child: Image.asset(
            ImageAssets.ministry,
          ),
        ),
      ),
    );
  }
}
