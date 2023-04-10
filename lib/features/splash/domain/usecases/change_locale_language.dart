import 'package:clean_arch_demo/core/error/Failures.dart';
import 'package:clean_arch_demo/core/usecases/usecase.dart';
import 'package:clean_arch_demo/features/splash/domain/repositories/language_repo.dart';
import 'package:dartz/dartz.dart';

class ChangeLocaleLanuguageUseCase implements UseCase<bool, String> {
  final LanugaugeRepo lanugaugeRepo;

  ChangeLocaleLanuguageUseCase({required this.lanugaugeRepo});
  @override
  Future<Either<Failuer, bool>>? call(String langCode) async =>
      await lanugaugeRepo.changeLanugauge(langCode: langCode);
}
