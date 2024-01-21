import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin LifeCycleUse<T extends StatefulWidget> on WidgetsBindingObserver, State<T> {
  void onResume();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
      resumeCallBack: () async {
        onResume();
      },
      suspedingCallBack: () async {},
    ));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspedingCallBack;

  LifecycleEventHandler({required this.resumeCallBack, required this.suspedingCallBack});

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumeCallBack();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        await suspedingCallBack();
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}
