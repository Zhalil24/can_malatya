import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../product/constanst/string_constanst.dart';

class NewsView extends ConsumerStatefulWidget {
  const NewsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<NewsView> {
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
                  StringConstants.titleNews,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              )),
        ],
      ),
    );
  }
}
