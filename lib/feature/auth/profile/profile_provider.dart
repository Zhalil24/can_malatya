import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileProvider extends StateNotifier<ProfileState> {
  ProfileProvider() : super(const ProfileState());
}

class ProfileState extends Equatable {
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  const ProfileState({this.isRequiredForceUpdate, this.isRedirectHome});

  @override
  List<Object?> get props => [isRedirectHome, isRedirectHome];

  ProfileState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return ProfileState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
