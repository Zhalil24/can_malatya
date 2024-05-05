import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@immutable
class AppStart {
  const AppStart._();
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }
}
