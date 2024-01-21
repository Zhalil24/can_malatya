import 'job_posting_view.dart';
import '../../product/services/manager/product_network_error_manager.dart';
import '../../product/services/manager/product_service_manager.dart';
import 'package:flutter/material.dart';

mixin JobPostingMixin on State<JobPostingView> {
  late final ProductNetworkManager productNetworkManager;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  @override
  void initState() {
    super.initState();
    productNetworkManager = ProductNetworkManager.base();
    productNetworkErrorManager = ProductNetworkErrorManager(context);

    productNetworkManager.listenErrorState(
      onErrorStatus: (value) {
        productNetworkErrorManager.handleError(value);
      },
    );
  }
}
