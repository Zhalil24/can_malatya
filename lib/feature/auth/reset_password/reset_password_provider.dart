import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPsswordProvider extends StateNotifier<ResetPasswordState> {
  ResetPsswordProvider() : super(const ResetPasswordState());

  void isLockStateChnage() {
    state = state.copyWith(isLockOpen: !state.isLockOpen!);
  }
}

class ResetPasswordState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final bool? isLockOpen;

  const ResetPasswordState({this.formKey, this.isLockOpen = false});

  ResetPasswordState copyWith({
    GlobalKey<FormState>? formKey,
    bool? isLockOpen,
  }) {
    return ResetPasswordState(formKey: formKey ?? this.formKey, isLockOpen: isLockOpen ?? this.isLockOpen);
  }

  @override
  List<Object?> get props => [formKey, isLockOpen];
}
