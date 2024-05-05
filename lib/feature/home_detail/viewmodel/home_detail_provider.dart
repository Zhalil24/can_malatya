import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDetailProvider extends StateNotifier<HomeDetailState> {
  HomeDetailProvider() : super(const HomeDetailState());
}

class HomeDetailState extends Equatable {
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  const HomeDetailState({this.isRequiredForceUpdate, this.isRedirectHome});

  @override
  List<Object?> get props => [isRedirectHome, isRedirectHome];

  HomeDetailState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return HomeDetailState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
