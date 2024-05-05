import 'dart:io';

import 'product_servive_path.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  final String baseUrl;

  ProductNetworkManager.base(ProductServicePath productServicePath)
      : baseUrl = productServicePath.rawValue,
        super(
          options: BaseOptions(baseUrl: productServicePath.rawValue),
        );

  /// [onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        onErrorStatus(error.response?.statusCode ?? HttpStatus.notFound);
      },
    ));
  }
}
