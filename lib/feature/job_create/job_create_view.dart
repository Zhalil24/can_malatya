import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../product/constanst/string_constanst.dart';

class JobCreateView extends ConsumerStatefulWidget {
  const JobCreateView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobCreateViewState();
}

class _JobCreateViewState extends ConsumerState<JobCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.padding.onlyRightMedium.right,
        left: context.padding.onlyLeftMedium.left,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.padding.onlyTopLow.top, left: context.padding.onlyLeftHigh.left * 1),
            child: Text(
              StringConstants.jobDetailTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const BodyText1(
            bodyText1: 'İlan Başlığı',
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: 'İşletme - Kişi Adı',
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: 'Telefonu',
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: 'Adres',
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: 'Yapılacak İşin Tanımı',
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: 'Tam Zamanlı - Yarı Zamanlı',
          ),
          TextFormField(),
          Padding(
            padding: EdgeInsets.only(
              top: context.padding.onlyTopLow.top,
              left: context.padding.onlyLeftHigh.left * 1.4,
            ),
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Esnaf Ekle',
                  style: Theme.of(context).textTheme.titleSmall,
                )),
          )
        ],
      ),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        Image.asset('assets/icons/icon2.png'),
        Text(
          StringConstants.appName,
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }
}

class BodyText1 extends StatelessWidget {
  const BodyText1({
    Key? key,
    required this.bodyText1,
  }) : super(key: key);

  final String bodyText1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.padding.onlyTopNormal.top,
        left: context.padding.onlyLeftLow.left,
      ),
      child: Text(
        bodyText1,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
