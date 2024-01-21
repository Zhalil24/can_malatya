import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());
}

class SplashState extends Equatable {
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  const SplashState({this.isRequiredForceUpdate, this.isRedirectHome});

  @override
  List<Object?> get props => [isRedirectHome, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
