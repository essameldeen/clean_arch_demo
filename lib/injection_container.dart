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
import 'package:clean_arch_demo/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:clean_arch_demo/features/splash/data/repositories/language_repo_Impl.dart';
import 'package:clean_arch_demo/features/splash/domain/repositories/language_repo.dart';
import 'package:clean_arch_demo/features/splash/domain/usecases/change_locale_language.dart';
import 'package:clean_arch_demo/features/splash/domain/usecases/get_language_save.dart';
import 'package:clean_arch_demo/features/splash/presentation/cubit/local_cubit.dart';
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

  serviceLocator.registerFactory(() => LocalCubit(
      getLanguageSavedUseCase: serviceLocator(),
      changeLocaleLanuguageUseCase: serviceLocator()));

  //usecase
  serviceLocator.registerLazySingleton(
      () => GetRandomQuoteUseCase(quoteRepository: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => GetLanguageSavedUseCase(repo: serviceLocator()));

  serviceLocator.registerLazySingleton(
      () => ChangeLocaleLanuguageUseCase(lanugaugeRepo: serviceLocator()));

  // repo

  serviceLocator.registerLazySingleton<QuoteRepository>(() =>
      QuoteRepositoryImpl(
          networkInfo: serviceLocator(),
          localDataSource: serviceLocator(),
          remoteDataSource: serviceLocator()));

  serviceLocator.registerLazySingleton<LanugaugeRepo>(
      () => LanguageRepoImpl(localDataSource: serviceLocator()));

  // Data Sources

  serviceLocator.registerLazySingleton<RandomQuoteLocalDataSource>(() =>
      RandomQuoteLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  serviceLocator.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: serviceLocator()));

  serviceLocator.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl(sharedPreferences: serviceLocator()));

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
