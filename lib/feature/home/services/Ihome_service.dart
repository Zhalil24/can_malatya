import '../model/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class IHomeService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IHomeService(this.manager, this.scaffoldKey);
  Future<List<Photos>?> fetchHomeList();
}
