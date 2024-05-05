import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constanst/project_radius.dart';
import '../../../product/constanst/string_constanst.dart';
import '../../../product/utlity/pick_image/life_cycle_manage_mixin.dart';
import '../../../product/utlity/pick_image/pick_manager.dart';

class HomeCreateView extends ConsumerStatefulWidget {
  const HomeCreateView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeCreateViewState();
}

class _HomeCreateViewState extends ConsumerState<HomeCreateView> with WidgetsBindingObserver, LifeCycleUse {
  final IPickManager pickImage = PickManager();
  XFile? image;

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
          const BodyText1(
            bodyText1: StringConstants.homeCreateTitle,
          ),
          buildImagePickButton(context),
          const BodyText1(
            bodyText1: StringConstants.businessOwner,
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: StringConstants.businessDescription,
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: StringConstants.businessPhone,
          ),
          TextFormField(),
          const BodyText1(
            bodyText1: StringConstants.businessAddress,
          ),
          TextFormField(),
          Padding(
            padding: EdgeInsets.only(
              top: context.padding.onlyTopLow.top,
              left: context.padding.onlyLeftHigh.left * 1.1,
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

  FutureBuilder<Uint8List> _FutureByteImage() {
    return FutureBuilder(
      future: image?.readAsBytes(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(ProjectRadius.large.value),
            child: Image.memory(
              snapshot.data!,
              fit: BoxFit.fill,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  InkWell buildImagePickButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        final model = await pickImage.fetchMediaImage();
        setState(() {
          image = model.file;
        });
      },
      child: Container(
        height: context.sized.height * 0.3,
        width: context.sized.width * 1,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(ProjectRadius.large.value),
        ),
        child: image != null
            ? _FutureByteImage()
            : Icon(
                Icons.library_add,
                size: context.sized.height * 0.1,
              ),
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

  @override
  void onResume() {
    print('git kontrol et photo library izni alınmış mı?');
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
