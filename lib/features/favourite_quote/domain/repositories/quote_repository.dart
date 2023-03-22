// like same interface
import 'package:dartz/dartz.dart';

import '../../../../core/error/Failures.dart';
import '../entities/quote.dart';

abstract class QuoteRepository {
  Future<Either<Failuer, Quote>>? getRandomQuote();
}
