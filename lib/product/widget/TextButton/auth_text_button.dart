import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({super.key, required this.buttonName, required this.onPressed});
  final String buttonName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.padding.onlyTopHigh.top * 8.8,
        left: context.padding.onlyLeftHigh.left * 2.7,
      ),
      child: Container(
        width: context.sized.width * 0.4,
        height: context.sized.height * 0.09,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
