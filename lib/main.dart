import 'package:flutter/material.dart';
import 'package:serial_terminal/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/services.dart';

Future main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]);
  runApp(ModularApp(module: AppModule()));
  }
