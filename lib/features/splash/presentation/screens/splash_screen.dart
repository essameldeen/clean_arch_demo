import 'dart:async';

import 'package:clean_arch_demo/config/routes/app_routes.dart';
import 'package:clean_arch_demo/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goToNext());
  }

  _goToNext() =>
      Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute);

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(ImageAssets.quote)),
    );
  }
}
