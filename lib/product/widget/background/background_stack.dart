import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: context.sized.width * 2,
          height: context.sized.height * 0.6,
          child: Image.asset(
            Theme.of(context).brightness == Brightness.dark ? 'assets/images/bck2.png' : 'assets/images/bck2_.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: context.sized.width * 1,
          height: context.sized.height * 0.35,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bck1.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: context.sized.width * 0.55,
                child: Image.asset(
                  'assets/icons/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top * 7.9),
          child: SizedBox(
            width: context.sized.width * 1,
            height: context.sized.height * 0.21,
            child: Image.asset(
              'assets/images/bck3.png',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
