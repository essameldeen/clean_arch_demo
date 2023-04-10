import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(const LocalStateInital(Locale(AppStrings.englishCode)));
}
