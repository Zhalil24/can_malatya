import 'register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constanst/string_constanst.dart';
import '../../../product/widget/Text/auth_text.dart';
import '../../../product/widget/TextButton/auth_text_button.dart';
import '../../../product/widget/background/background_stack.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final loginProvider = StateNotifierProvider<RegisterProvider, RegisterState>((ref) {
    return RegisterProvider();
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
              const Authtext(textName: StringConstants.registerTile),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 5),
                child: buildTextFromFieldEmail(formKey, context),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 6),
                child: buildTextFromFieldPassword(formKey, context),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 7),
                child: buildTextFromFieldPasswordControl(formKey, context),
              ),
              AuthTextButton(
                buttonName: StringConstants.register,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTextFromFieldEmail(GlobalKey<FormState>? formKey, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.horizontalNormal.horizontal),
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
      padding: EdgeInsets.symmetric(horizontal: context.padding.horizontalNormal.horizontal),
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

  buildTextFromFieldPasswordControl(GlobalKey<FormState>? formKey, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.horizontalNormal.horizontal),
      child: TextFormField(
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: ref.read(loginProvider).isLockOpen!,
        decoration: InputDecoration(
            labelText: 'Again Password',
            suffixIcon: IconButton(
                onPressed: () {
                  ref.watch(loginProvider.notifier).isLockStateChnage();
                },
                icon: Icon(ref.read(loginProvider).isLockOpen! ? Icons.lock : Icons.lock_open))),
      ),
    );
  }
}
