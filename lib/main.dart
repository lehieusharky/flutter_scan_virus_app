import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:virusscanapp/src/di/injection.dart';
import 'package:virusscanapp/src/modules/my_app/my_app.dart';

Future<void> main() async {
  // dependencies injection initialization
  configureDependencies();

  // environment file initialization
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}
