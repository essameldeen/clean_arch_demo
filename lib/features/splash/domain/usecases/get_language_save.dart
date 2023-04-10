import 'package:clean_arch_demo/core/error/Failures.dart';
import 'package:clean_arch_demo/core/usecases/usecase.dart';
import 'package:clean_arch_demo/features/splash/domain/repositories/language_repo.dart';
import 'package:dartz/dartz.dart';

class GetLanguageSavedUseCase implements UseCase<String, NoParams> {
  final LanugaugeRepo repo;

  GetLanguageSavedUseCase({required this.repo});
  @override
  Future<Either<Failuer, String>> call(NoParams params) async =>
      await repo.getSavedLang();
}
