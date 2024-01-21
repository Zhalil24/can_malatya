import 'services/Ihome_service.dart';
import 'services/home_service.dart';
import '../../product/models/photos_model.dart';
import '../../product/services/manager/product_service_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(const HomeState());

  var pageController = PageController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late IHomeService homaService;

  void changePage(int index) {
    pageController.jumpToPage(index);
    state = state.copyWith(selectedIndex: index);
  }

  void changeLoading() {
    Future.delayed(Duration.zero, () {
      state = state.copyWith(isLoading: !state.isLoading!);
    });
  }

  void init() {
    homaService = HomeService(ProductNetworkManager.base(), scaffoldKey);
  }

  Future<void> getListAll() async {
    changeLoading();
    var fetchedPhotos = await homaService.fetchHomeList();
    state = state.copyWith(photos: fetchedPhotos != null ? fetchedPhotos : []);
    changeLoading();
  }
}

class HomeState extends Equatable {
  final bool? isLoading;
  final int? selectedIndex;
  final List<Photos>? photos;

  const HomeState({this.selectedIndex = 0, this.isLoading = false, this.photos});

  @override
  List<Object?> get props => [selectedIndex, isLoading, photos];

  HomeState copyWith({
    bool? isLoading,
    int? selectedIndex,
    List<Photos>? photos,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
      photos: photos ?? this.photos,
    );
  }
}
