import 'package:clean_arch_demo/core/utils/app_colors.dart';

import 'package:flutter/material.dart';

class QuoteConetent extends StatelessWidget {
  const QuoteConetent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            "Essam mohamed hi this is first quo we get it from the api",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text("Essam Mohamed"),
          )
        ],
      ),
    );
  }
}
