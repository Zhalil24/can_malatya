import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/post_model.dart';
import '../../../product/services/manager/product_service_manager.dart';
import '../../../product/services/manager/product_servive_path.dart';
import '../services/Ijob_posting_service.dart';
import '../services/job_posting_service.dart';

class JobPostingProvider extends StateNotifier<JobPostingState> {
  JobPostingProvider() : super(const JobPostingState());

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late IJobPostingService jobPostingService;

  void changeLoading() {
    Future.delayed(Duration.zero, () {
      state = state.copyWith(isLoading: !state.isLoading!);
    });
  }

  void init() {
    jobPostingService = JopPostingService(ProductNetworkManager.base(ProductServicePath.posts), scaffoldKey);
  }

  Future<void> fetchPosts() async {
    changeLoading();
    final response = await jobPostingService.fetchJobPostingList();
    state = state.copyWith(posts: response != null ? response : []);
    changeLoading();
  }
}

class JobPostingState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final bool? isLoading;
  final List<Posts>? posts;
  const JobPostingState({this.formKey, this.isLoading = false, this.posts});

  JobPostingState copyWith({
    GlobalKey<FormState>? formKey,
    bool? isLoading,
    List<Posts>? posts,
  }) {
    return JobPostingState(
      formKey: formKey ?? this.formKey,
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [formKey, isLoading, posts];
}
