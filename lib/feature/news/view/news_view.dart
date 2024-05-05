import '../model/article_model.dart';
import '../viewmodel/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../product/constanst/project_radius.dart';
import '../../../product/constanst/string_constanst.dart';

final newsProvider = StateNotifierProvider<NewsProvider, NewsState>((ref) {
  return NewsProvider();
});

class NewsView extends ConsumerStatefulWidget {
  const NewsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<NewsView> {
  @override
  void initState() {
    super.initState();
    ref.read(newsProvider.notifier).init();
    ref.read(newsProvider.notifier).getListAll();
  }

  @override
  Widget build(BuildContext context) {
    final values = ref.watch(newsProvider).article ?? [];

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: ListViewCard(values: values),
          ),
          if (ref.watch(newsProvider).isLoading ?? false) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange,
        width: double.maxFinite,
        height: context.sized.height * 0.035,
        child: Center(
          child: Text(
            StringConstants.titleNews,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ));
  }
}

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    super.key,
    required this.values,
  });
  final List<Article> values;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) => cardButton(context, index),
    );
  }

  InkWell cardButton(BuildContext context, int index) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(values[index].url ?? "");

        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Padding(
        padding: EdgeInsets.all(context.padding.normal.top),
        child: buildContainer(context, index),
      ),
    );
  }

  Container buildContainer(BuildContext context, int index) {
    return Container(
      width: context.sized.width * 0.9,
      height: context.sized.height * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ProjectRadius.medium.value),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [firstRow(context, index), secondRow(context, index)],
      ),
    );
  }

  Row secondRow(BuildContext context, int index) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: context.padding.onlyLeftHigh.left * 1.1,
            top: context.padding.onlyTopHigh.top * 0.12,
          ),
          child: Text('Haberin Devamı İçin Tıklayınız'),
        ),
      ],
    );
  }

  Row firstRow(BuildContext context, int index) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.padding.onlyLeftHigh.left * 0.3,
              ),
              child: SizedBox(
                width: context.sized.width * 0.8,
                child: Text(
                  values[index].title ?? "",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
