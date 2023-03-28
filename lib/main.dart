import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc_observer.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // to ensure that all function finished before running
  Bloc.observer = MyBlocObserver();
  await di.init();

  runApp(const QuoteApp());
}
