import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobDetailProvider extends StateNotifier<JobDetailState> {
  JobDetailProvider() : super(const JobDetailState());
}

class JobDetailState extends Equatable {
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  const JobDetailState({this.isRequiredForceUpdate, this.isRedirectHome});

  @override
  List<Object?> get props => [isRedirectHome, isRedirectHome];

  JobDetailState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return JobDetailState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
