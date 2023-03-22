import 'dart:collection';

import 'package:clean_arch_demo/core/error/Failures.dart';
import 'package:clean_arch_demo/core/usecases/usecase.dart';
import 'package:clean_arch_demo/features/favourite_quote/domain/entities/quote.dart';
import 'package:clean_arch_demo/features/favourite_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomQuoteUseCase extends UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuoteUseCase({required this.quoteRepository});

  @override
  Future<Either<Failuer, Quote>>? call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}

// if there is usecase need params
class LoginParams extends Equatable {
  final String name;
  final String password;

  const LoginParams({required this.name, required this.password});

  @override
  List<Object?> get props => [];
}
