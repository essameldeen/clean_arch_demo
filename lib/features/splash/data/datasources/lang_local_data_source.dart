import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageLocalDataSource {
  Future<bool> changeLanugauge({required String langCode});

  Future<String?> getSavedLang();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  final SharedPreferences preferences;

  LanguageLocalDataSourceImpl(this.preferences);
  @override
  Future<bool> changeLanugauge({required String langCode}) async =>
      await preferences.setString(AppStrings.local, langCode);

  @override
  Future<String?> getSavedLang() async =>
      preferences.containsKey(AppStrings.local)
          ? preferences.getString(AppStrings.local)
          : AppStrings.englishCode;
}
