import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocalState extends Equatable {
  final Locale _local;

  const LocalState(this._local);
  List<Object?> get props => [_local];
}

class LocalStateInital extends LocalState {
  final Locale initalLocal;
  const LocalStateInital(this.initalLocal) : super(initalLocal);
}

class ChangeLocaleState extends LocalState {
  const ChangeLocaleState(Locale selectedLocal) : super(selectedLocal);
}
