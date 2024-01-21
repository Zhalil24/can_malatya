import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart'; // GlobalKey'ı kullanabilmek için bu satırı ekledik
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(const LoginState());

  void isLockStateChnage() {
    state = state.copyWith(isLockOpen: !state.isLockOpen!);
  }
}

class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final bool? isLockOpen;

  const LoginState({this.formKey, this.isLockOpen = false});

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    bool? isLockOpen,
  }) {
    return LoginState(formKey: formKey ?? this.formKey, isLockOpen: isLockOpen ?? this.isLockOpen);
  }

  @override
  List<Object?> get props => [formKey, isLockOpen];
}
