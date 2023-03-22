import 'package:equatable/equatable.dart';

abstract class Failuer extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailur extends Failuer {}

class CacheFailur extends Failuer {}
