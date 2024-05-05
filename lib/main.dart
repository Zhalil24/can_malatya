import 'package:can_malatya/product/initialize/app_start/app_start.dart';
import 'feature/home/view/home_view.dart';
import 'product/initialize/theme/custom_dark_theme.dart';
import 'product/initialize/theme/custom_light_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      home: const HomeView(),
    );
  }
}
