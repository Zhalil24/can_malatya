import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsProvider extends StateNotifier<NewsState> {
  NewsProvider() : super(const NewsState());
}

class NewsState extends Equatable {
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  const NewsState({this.isRequiredForceUpdate, this.isRedirectHome});

  @override
  List<Object?> get props => [isRedirectHome, isRedirectHome];

  NewsState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return NewsState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
