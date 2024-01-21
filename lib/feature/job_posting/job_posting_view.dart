import '../job_create/job_create_view.dart';
import '../job_detail/job_detail_view.dart';
import 'job_posting_provider.dart';
import '../../product/constanst/project_radius.dart';
import '../../product/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../product/constanst/string_constanst.dart';

final _jobPostingProvider = StateNotifierProvider<JobPostingProvider, JobPostingState>((ref) {
  return JobPostingProvider();
});

class JobPostingView extends ConsumerStatefulWidget {
  const JobPostingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobPostingViewState();
}

class _JobPostingViewState extends ConsumerState<JobPostingView> {
  @override
  void initState() {
    super.initState();
    ref.read(_jobPostingProvider.notifier).init();
    ref.read(_jobPostingProvider.notifier).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final values = ref.watch(_jobPostingProvider).posts ?? [];
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          JobCreatePushButton(),
          Expanded(
            child: ListViewCard(values: values),
          ),
          if (ref.watch(_jobPostingProvider).isLoading ?? false) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    super.key,
    required this.values,
  });

  final List<Posts> values;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) => cardButton(context, index),
    );
  }

  InkWell cardButton(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobDetailView(values[index].title!, values[index].body!)),
        );
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
        Container(
          margin: context.padding.onlyLeftLow,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(ProjectRadius.small.value),
          ),
          child: Text(
            '${values[index].userId!}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: context.padding.onlyLeftHigh.left * 1.3),
          child: Text('Detay İçin Tıklayınız'),
        ),
      ],
    );
  }

  Row firstRow(BuildContext context, int index) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: context.padding.onlyLeftLow.left,
            top: context.padding.onlyTopLow.top,
          ),
          child: Image.asset(
            'assets/icons/icon2.png',
            height: context.sized.height * 0.08,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              values[index].title!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(values[index].title!),
          ],
        )
      ],
    );
  }
}

class JobCreatePushButton extends StatelessWidget {
  const JobCreatePushButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.padding.onlyTopLow.top,
        right: context.padding.onlyLeftHigh.left * 1.7,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JobCreateView()),
          );
        },
        child: Text(
          StringConstants.jobPostingTitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
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
            StringConstants.titleJob,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ));
  }
}
