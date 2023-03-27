import 'package:clean_arch_demo/core/utils/app_colors.dart';
import 'package:clean_arch_demo/features/random_quote/domain/entities/quote.dart';

import 'package:flutter/material.dart';

class QuoteConetent extends StatelessWidget {
  final Quote? quote;
  const QuoteConetent({super.key, required this.quote});

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
            quote?.content ?? "Quote Content is Empty",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(quote?.author ?? "No Auothor For This Quote"),
          )
        ],
      ),
    );
  }
}
