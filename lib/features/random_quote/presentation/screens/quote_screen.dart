import 'package:clean_arch_demo/core/utils/app_colors.dart';
import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:clean_arch_demo/core/utils/assets_manager.dart';
import 'package:clean_arch_demo/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        body: _buildBodyContent());
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        QuoteConetent(),
        InkWell(
          onTap: () => {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
            child: const Icon(
              Icons.refresh,
              size: 28,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
