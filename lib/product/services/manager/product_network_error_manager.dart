import 'dart:io';

import 'package:flutter/material.dart';

final class ProductNetworkErrorManager {
  ProductNetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(value) {
    if (value == HttpStatus.unauthorized) {}
  }
}
