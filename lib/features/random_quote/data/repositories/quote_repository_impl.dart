import 'package:clean_arch_demo/core/error/exceptions.dart';
import 'package:clean_arch_demo/core/network/network_info.dart';
import 'package:clean_arch_demo/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_arch_demo/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:clean_arch_demo/features/random_quote/domain/entities/quote.dart';
import 'package:clean_arch_demo/core/error/Failures.dart';
import 'package:clean_arch_demo/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource localDataSource;
  final RandomQuoteRemoteDataSource remoteDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
      required this.localDataSource,
      required this.remoteDataSource});
  @override
  Future<Either<Failuer, Quote>>? getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuote = await remoteDataSource.getRandomQuote();
        localDataSource.cacheQuote(remoteQuote);
        return Right(remoteQuote);
      } on ServerException {
        return Left(ServerFailur());
      }
    } else {
      try {
        final cacheQuote = await localDataSource.getLastRandomQuote();
        return Right(cacheQuote);
      } on CachException {
        return left(CacheFailur());
      }
    }
  }
}
