import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../product/constanst/string_constanst.dart';
import '../../product/widget/Text/vawy_text.dart';
import '../../product/widget/TextButton/auth_text_button.dart';
import '../../product/widget/background/background_stack.dart';
import '../auth/login/login_view.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundStack(),
          const AppName(),
          AuthTextButton(
            buttonName: StringConstants.loginstart,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginView()));
            },
          ),
        ],
      ),
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.padding.onlyTopHigh.top * 5,
        left: context.padding.onlyLeftMedium.left,
      ),
      child: Column(
        children: [
          Image.asset(
            Theme.of(context).brightness == Brightness.dark ? 'assets/icons/icon.png' : 'assets/icons/icon2.png',
          ),
          SizedBox(
            height: context.sized.dynamicHeight(0.04),
          ),
          const WavyText(title: StringConstants.appName),
        ],
      ),
    );
  }
}
