import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/post_model.dart';

abstract class IJobPostingService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IJobPostingService(this.manager, this.scaffoldKey);
  Future<List<Posts>?> fetchJobPostingList();
}
