import 'package:clean_arch_demo/core/error/Failures.dart';
import 'package:clean_arch_demo/core/usecases/usecase.dart';
import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:clean_arch_demo/features/splash/domain/usecases/change_locale_language.dart';
import 'package:clean_arch_demo/features/splash/domain/usecases/get_language_save.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  static LocalCubit get(context) => BlocProvider.of(context);

  final GetLanguageSavedUseCase getLanguageSavedUseCase;
  final ChangeLocaleLanuguageUseCase changeLocaleLanuguageUseCase;

  LocalCubit(
      {required this.getLanguageSavedUseCase,
      required this.changeLocaleLanuguageUseCase})
      : super(const LocalStateInital(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;
  Future<void> getSavedLang() async {
    final response = await getLanguageSavedUseCase.call(NoParams());

    response.fold((faliur) => debugPrint(AppStrings.cacheFailuer), (valule) {
      currentLangCode = valule;
      emit(ChangeLocaleState(Locale(valule)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLocaleLanuguageUseCase.call(langCode);
    response!.fold((faliur) => debugPrint(AppStrings.cacheFailuer), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(langCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
