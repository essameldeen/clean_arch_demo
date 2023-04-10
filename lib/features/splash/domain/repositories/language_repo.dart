import 'package:clean_arch_demo/core/error/Failures.dart';
import 'package:dartz/dartz.dart';

abstract class LanugaugeRepo {
  Future<Either<Failuer, bool>> changeLanugauge({required String langCode});

  Future<Either<Failuer, String>> getSavedLang();
}
