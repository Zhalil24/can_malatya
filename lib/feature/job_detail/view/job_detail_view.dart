import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constanst/project_radius.dart';
import '../../../product/constanst/string_constanst.dart';

class JobDetailView extends ConsumerStatefulWidget {
  const JobDetailView(this.titleText, this.description, {super.key, String? title});
  final String titleText;
  final String description;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends ConsumerState<JobDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              buildBodyWidget(context),
              buildTitleWidget(context),
              AppBar(
                backgroundColor: Colors.transparent,
                actions: [
                  Image.asset('assets/icons/icon2.png'),
                  Text(
                    StringConstants.appName,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: context.padding.onlyTopHigh.top, left: context.padding.onlyLeftHigh.left * 1.2),
                child: Text(
                  StringConstants.jobDetailTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget buildBodyWidget(BuildContext context) {
    return Container(
      height: context.sized.height * 1,
      width: context.sized.width * 1,
      decoration: BoxDecoration(
        color: const ColorScheme.light().surface,
        borderRadius: BorderRadius.all(
          Radius.circular(ProjectRadius.medium.value),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: context.padding.onlyLeftMedium.left,
          right: context.padding.onlyRightMedium.right,
          top: context.padding.onlyTopHigh.top * 3.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyText1(
              bodyText1: 'İlan Başlığı',
            ),
            BodyText(
              bodyText: widget.titleText,
            ),
            BodyText1(
              bodyText1: 'İşletme - Kişi Adı',
            ),
            BodyText(
              bodyText: "Malatya Et Lokantası",
            ),
            BodyText1(
              bodyText1: 'Telefonu',
            ),
            BodyText(
              bodyText: "O5555555555",
            ),
            BodyText1(
              bodyText1: 'Adres',
            ),
            BodyText(
              bodyText: "Malatya İnönü Cad No: 39",
            ),
            BodyText1(
              bodyText1: 'Yapılacak İşin Tanımı',
            ),
            BodyText(
              bodyText: widget.description,
            ),
            BodyText1(
              bodyText1: 'Tam Zamanlı - Yarı Zamanlı',
            ),
            BodyText(
              bodyText: "Tam Zamanlı",
            ),
          ],
        ),
      ),
    );
  }

  Padding buildTitleWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.sized.height * 0.2),
      child: Center(
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
    );
  }

  /*Container buildImageWidget(BuildContext context) {
    return Container(
      height: context.sized.height * 0.02,
      width: double.infinity,
      alignment: Alignment.topLeft,
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
  }*/
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
