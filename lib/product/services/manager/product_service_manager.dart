import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"),
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
