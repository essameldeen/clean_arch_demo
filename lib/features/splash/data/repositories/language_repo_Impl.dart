import 'package:clean_arch_demo/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch_demo/core/error/Failures.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/language_repo.dart';

class LanguageRepoImpl extends LanugaugeRepo {
  final LanguageLocalDataSource localDataSource;

  LanguageRepoImpl(this.localDataSource);
  @override
  Future<Either<Failuer, bool>> changeLanugauge(
      {required String langCode}) async {
    try {
      final languageIsChanged =
          await localDataSource.changeLanugauge(langCode: langCode);
      return Right(languageIsChanged);
    } on ServerException {
      return Left(ServerFailur());
    }
  }

  @override
  Future<Either<Failuer, String>> getSavedLang() async {
    try {
      final language = await localDataSource.getSavedLang();
      return Right(language!);
    } on ServerException {
      return Left(ServerFailur());
    }
  }
}
