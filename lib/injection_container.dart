import 'package:clean_arch_demo/core/apis/api_consumer.dart';
import 'package:clean_arch_demo/core/apis/app_interceptor.dart';
import 'package:clean_arch_demo/core/apis/dio_consumer.dart';
import 'package:clean_arch_demo/core/network/network_info.dart';
import 'package:clean_arch_demo/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_arch_demo/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:clean_arch_demo/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:clean_arch_demo/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:clean_arch_demo/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:clean_arch_demo/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! features

  //blocs
  serviceLocator.registerFactory(
      () => RandomQuoteCubit(getRandomQuoteUseCase: serviceLocator()));

  //usecase
  serviceLocator.registerLazySingleton(
      () => GetRandomQuoteUseCase(quoteRepository: serviceLocator()));

  // repo

  serviceLocator.registerLazySingleton<QuoteRepository>(() =>
      QuoteRepositoryImpl(
          networkInfo: serviceLocator(),
          localDataSource: serviceLocator(),
          remoteDataSource: serviceLocator()));

  // Data Sources

  serviceLocator.registerLazySingleton<RandomQuoteLocalDataSource>(() =>
      RandomQuoteLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  serviceLocator.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: serviceLocator()));
  //! core

  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(checker: serviceLocator()));

  serviceLocator.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(dio: serviceLocator()));
  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => AppInterceptor());
  serviceLocator.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));

  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
