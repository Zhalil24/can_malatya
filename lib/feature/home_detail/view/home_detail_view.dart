import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constanst/string_constanst.dart';

class HomeDetailView extends ConsumerStatefulWidget {
  const HomeDetailView(this.titleText, this.imageUrl, {super.key, String? title});
  final String titleText;
  final String imageUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends ConsumerState<HomeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              buildImageWidget(context),
              buildBodyWidget(context),
              buildTitleWidget(context),
            ],
          ),
        ],
      ),
    ));
  }

  Padding buildBodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.sized.height * 0.25),
      child: Container(
        height: context.sized.height * 0.8,
        width: context.sized.width * 1,
        decoration: BoxDecoration(
          color: const ColorScheme.light().surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: context.padding.onlyLeftMedium.left,
            right: context.padding.onlyRightMedium.right,
            top: context.padding.onlyTopHigh.top,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText1(
                bodyText1: StringConstants.businessOwner,
              ),
              BodyText(
                bodyText: "Halil Zilif",
              ),
              BodyText1(
                bodyText1: StringConstants.businessDescription,
              ),
              BodyText(
                bodyText: "Oto Tamir Elektirik Antifiriz değişimi far temizleme klima gazı dolumu motor yağ değişimi motor bakımı",
              ),
              BodyText1(
                bodyText1: StringConstants.businessPhone,
              ),
              BodyText(
                bodyText: "05555555555",
              ),
              BodyText1(
                bodyText1: StringConstants.businessAddress,
              ),
              BodyText(
                bodyText: "Battalgazi",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTitleWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.sized.height * 0.2),
      child: Center(
        child: Container(
          height: context.sized.height * 0.1,
          width: context.sized.width * 0.7,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Container(
                height: 100,
                width: 330,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 206, 206).withOpacity(0.8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.titleText,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildImageWidget(BuildContext context) {
    return Container(
      height: context.sized.height * 0.275,
      width: double.infinity,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.imageUrl))),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.padding.onlyTopHigh.top * 0.6,
          left: context.padding.onlyLeftLow.left,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: context.sized.height * 0.04,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class BodyText1 extends StatelessWidget {
  const BodyText1({
    super.key,
    required this.bodyText1,
  });
  final String bodyText1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.padding.onlyTopNormal.top),
      child: Text(
        bodyText1,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText({
    super.key,
    required this.bodyText,
  });
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.padding.onlyTopNormal.top),
      child: Text(
        bodyText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
