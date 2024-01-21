import '../reset_password/reset_pasoword_view.dart';
import '../../home/home_view.dart';

import 'login_provider.dart';
import '../register/register_view.dart';
import '../../../product/widget/Text/auth_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../../product/constanst/string_constanst.dart';
import '../../../product/widget/TextButton/auth_text_button.dart';
import '../../../product/widget/background/background_stack.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
    return LoginProvider();
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState>? formKey = ref.watch(loginProvider).formKey;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: ref.watch(loginProvider).formKey,
          child: Stack(
            children: [
              const BackgroundStack(),
              const Authtext(textName: StringConstants.logintitle),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 5.5),
                child: buildTextFromFieldEmail(formKey, context),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 6.5),
                child: buildTextFromFieldPassword(formKey, context),
              ),
              AuthTextButton(
                buttonName: StringConstants.login,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeView()));
                },
              ),
              const RegisterButton(),
              resetPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding resetPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 7.4, left: context.padding.onlyLeftHigh.left * 2.7),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswordView()));
          },
          child: Text(
            StringConstants.forgotpassword,
            style: Theme.of(context).textTheme.displaySmall,
          )),
    );
  }

  buildTextFromFieldEmail(GlobalKey<FormState>? formKey, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.padding.horizontalLow.horizontal,
      ),
      child: TextFormField(
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        decoration: const InputDecoration(
          labelText: 'Email',
        ),
      ),
    );
  }

  buildTextFromFieldPassword(GlobalKey<FormState>? formKey, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.horizontalLow.horizontal),
      child: TextFormField(
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: ref.read(loginProvider).isLockOpen!,
        decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
                onPressed: () {
                  ref.watch(loginProvider.notifier).isLockStateChnage();
                },
                icon: Icon(ref.read(loginProvider).isLockOpen! ? Icons.lock : Icons.lock_open))),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.padding.onlyTopHigh.top * 9.35,
        left: context.padding.onlyLeftLow.left,
      ),
      child: SizedBox(
        width: context.sized.dynamicWidth(0.4),
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterView()));
            },
            child: const Text(
              StringConstants.dontAccount,
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Text(
          StringConstants.forgotpassword,
          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        ));
  }
}
