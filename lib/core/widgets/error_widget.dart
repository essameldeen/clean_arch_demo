import 'package:clean_arch_demo/config/locale/app_localizations.dart';
import 'package:clean_arch_demo/core/media_query_extinstion.dart';
import 'package:clean_arch_demo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorWidgetScreen extends StatelessWidget {
  final VoidCallback? onpress;
  const ErrorWidgetScreen({super.key, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Icon(
          Icons.warning_amber_rounded,
          color: AppColors.primary,
          size: 150,
        )),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              AppLocalizations.of(context)!.translate("something_went_wrong")!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            )),
        Text(
          AppLocalizations.of(context)!.translate("try_again")!,
          style: TextStyle(
              color: AppColors.hint, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          height: 55,
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: context.width * 0.55,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                if (onpress != null) {
                  onpress!();
                }
              },
              child: Text(
                AppLocalizations.of(context)!.translate("reload_screen")!,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )),
        )
      ],
    );
  }
}
