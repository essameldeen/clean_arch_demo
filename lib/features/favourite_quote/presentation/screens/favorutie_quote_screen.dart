import 'package:clean_arch_demo/core/utils/constants.dart';
import 'package:flutter/material.dart';

class FavouriteQuoteScreen extends StatelessWidget {
  const FavouriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () =>
            Constants.showToast(message: "Done", type: ToastType.SUCCESS),
        child: const Text(
          "Favourite Quote",
          style: TextStyle(fontSize: 25.0, color: Colors.black),
        ),
      )),
    );
  }
}
