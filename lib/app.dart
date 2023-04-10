import 'package:clean_arch_demo/config/locale/app_localizations_setup.dart';
import 'package:clean_arch_demo/config/routes/app_routes.dart';
import 'package:clean_arch_demo/config/themes/app_theme.dart';
import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/presentation/cubit/local_cubit.dart';
import 'features/splash/presentation/cubit/local_state.dart';
import 'injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.serviceLocator<LocalCubit>()..getSavedLang(),
      child: BlocBuilder<LocalCubit, LocalState>(
        buildWhen: (previousState, currentState) {
          return currentState != previousState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: state.local,
            title: AppStrings.appName,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
