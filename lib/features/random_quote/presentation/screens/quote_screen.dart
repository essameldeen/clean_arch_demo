import 'package:clean_arch_demo/core/utils/app_colors.dart';
import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:clean_arch_demo/core/widgets/error_widget.dart';
import 'package:clean_arch_demo/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_arch_demo/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appName),
          ),
          body: ErrorWidgetScreen()),
      onRefresh: () => RandomQuoteCubit.get(context).getRandomQuote(),
    );
  }

  Widget _buildBodyContent() {
    return BlocConsumer<RandomQuoteCubit, RandomQuoteState>(
      listener: (context, state) {
        if (state is RandomGetQuoteIsLoading) {
          Center(
            child: SpinKitFadingCircle(
              color: AppColors.primary,
            ),
          );
        } else if (state is RandomGetQuoteError) {
          Text(state.error);
        }
      },
      builder: (context, state) {
        var quote = RandomQuoteCubit.get(context).quoteData;
        return Column(
          children: [
            QuoteConetent(
              quote: quote,
            ),
            InkWell(
              onTap: () => {RandomQuoteCubit.get(context).getRandomQuote()},
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary),
                child: const Icon(
                  Icons.refresh,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
