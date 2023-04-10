import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageLocalDataSource {
  Future<bool> changeLanugauge({required String langCode});

  Future<String?> getSavedLang();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  final SharedPreferences sharedPreferences;

  LanguageLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLanugauge({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.local, langCode);

  @override
  Future<String?> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.local)
          ? sharedPreferences.getString(AppStrings.local)
          : AppStrings.englishCode;
}
