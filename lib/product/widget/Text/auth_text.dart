import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Authtext extends StatelessWidget {
  const Authtext({super.key, required this.textName});
  final String textName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 4, left: context.padding.onlyLeftMedium.left * 0.8),
      child: Text(
        textName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
