import 'reset_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constanst/string_constanst.dart';
import '../../../product/widget/Text/auth_text.dart';
import '../../../product/widget/TextButton/auth_text_button.dart';
import '../../../product/widget/background/background_stack.dart';
import '../register/register_view.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends ConsumerState<ResetPasswordView> {
  final loginProvider = StateNotifierProvider<ResetPsswordProvider, ResetPasswordState>((ref) {
    return ResetPsswordProvider();
  });

  @override
  void initState() {
    super.initState();
  }

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
              const Authtext(textName: StringConstants.forgotpassword),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 4.8),
                child: buildTextFromFieldEmail(formKey, context),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 5.65),
                child: buildTextFromFieldPassword(formKey, context),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 6.5),
                child: buildTextFromFieldNewPassword(formKey, context),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 7.35),
                child: buildTextFromFieldNewPasswordAgain(formKey, context),
              ),
              AuthTextButton(
                buttonName: StringConstants.login,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterView()));
                },
              ),
            ],
          ),
        ),
      ),
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
        decoration: const InputDecoration(
          labelText: 'Kod',
        ),
      ),
    );
  }

  buildTextFromFieldNewPassword(GlobalKey<FormState>? formKey, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.horizontalLow.horizontal),
      child: TextFormField(
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: ref.read(loginProvider).isLockOpen!,
        decoration: const InputDecoration(
          labelText: 'Yeni Şifre',
        ),
      ),
    );
  }

  buildTextFromFieldNewPasswordAgain(GlobalKey<FormState>? formKey, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.horizontalLow.horizontal),
      child: TextFormField(
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: ref.read(loginProvider).isLockOpen!,
        decoration: const InputDecoration(
          labelText: 'Yeni Şifre Tekrarı',
        ),
      ),
    );
  }
}
