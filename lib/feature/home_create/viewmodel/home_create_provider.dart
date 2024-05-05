import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCreateProvider extends StateNotifier<HomeCreateState> {
  HomeCreateProvider() : super(const HomeCreateState());
}

class HomeCreateState extends Equatable {
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  const HomeCreateState({this.isRequiredForceUpdate, this.isRedirectHome});

  @override
  List<Object?> get props => [isRedirectHome, isRedirectHome];

  HomeCreateState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return HomeCreateState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
