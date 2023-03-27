part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomGetQuoteIsLoading extends RandomQuoteState {}

class RandomGetQuoteSuccess extends RandomQuoteState {
  final Quote quote;
  const RandomGetQuoteSuccess({required this.quote});

  @override
  List<Object> get props => [quote];
}

class RandomGetQuoteError extends RandomQuoteState {
  final String error;
  const RandomGetQuoteError({required this.error});
  @override
  List<Object> get props => [error];
}
