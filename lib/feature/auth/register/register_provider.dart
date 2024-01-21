import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterProvider extends StateNotifier<RegisterState> {
  RegisterProvider() : super(const RegisterState());

  void isLockStateChnage() {
    state = state.copyWith(isLockOpen: !state.isLockOpen!);
  }
}

class RegisterState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final bool? isLockOpen;

  const RegisterState({this.formKey, this.isLockOpen = false});

  RegisterState copyWith({
    GlobalKey<FormState>? formKey,
    bool? isLockOpen,
  }) {
    return RegisterState(formKey: formKey ?? this.formKey, isLockOpen: isLockOpen ?? this.isLockOpen);
  }

  @override
  List<Object?> get props => [formKey, isLockOpen];
}
