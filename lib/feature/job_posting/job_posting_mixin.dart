import 'package:flutter/material.dart';

import '../../product/services/manager/product_network_error_manager.dart';
import '../../product/services/manager/product_service_manager.dart';
import '../../product/services/manager/product_servive_path.dart';
import 'view/job_posting_view.dart';

mixin JobPostingMixin on State<JobPostingView> {
  late final ProductNetworkManager productNetworkManager;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  @override
  void initState() {
    super.initState();
    productNetworkManager = ProductNetworkManager.base(ProductServicePath.posts);
    productNetworkErrorManager = ProductNetworkErrorManager(context);

    productNetworkManager.listenErrorState(
      onErrorStatus: (value) {
        productNetworkErrorManager.handleError(value);
      },
    );
  }
}
