import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:winsoft_task/injection.dart';
import 'package:winsoft_task/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.dev);

  runApp(App());
}