import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FavouriteQuoteScreen extends StatelessWidget {
  const FavouriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Favourite Quote",
        style: TextStyle(fontSize: 25.0, color: Colors.black),
      )),
    );
  }
}
