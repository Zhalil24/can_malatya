import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constanst/string_constanst.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.orange,
              width: double.maxFinite,
              height: context.sized.height * 0.035,
              child: Center(
                child: Text(
                  StringConstants.titleProfile,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              )),
        ],
      ),
    );
  }
}
