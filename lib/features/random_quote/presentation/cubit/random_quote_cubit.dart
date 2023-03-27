import 'package:bloc/bloc.dart';
import 'package:clean_arch_demo/core/error/Failures.dart';
import 'package:clean_arch_demo/core/usecases/usecase.dart';
import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:clean_arch_demo/features/random_quote/domain/entities/quote.dart';
import 'package:clean_arch_demo/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;
  Quote? quoteData;

  static RandomQuoteCubit get(context) => BlocProvider.of(context);

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    Either<Failuer, Quote>? response = await getRandomQuoteUseCase(NoParams());

    emit(response!.fold(
        (failuer) => RandomGetQuoteError(error: _mapFailuerToMessage(failuer)),
        (quote) {
      quoteData = quote;
      return RandomGetQuoteSuccess(quote: quote);
    }));
  }

  String _mapFailuerToMessage(Failuer failuer) {
    switch (failuer.runtimeType) {
      case ServerFailur:
        return AppStrings.serverFailuer;
      case CacheFailur:
        return AppStrings.cacheFailuer;

      default:
        return AppStrings.unexpectedFiluer;
    }
  }
}
