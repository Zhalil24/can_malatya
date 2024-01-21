import '../auth/profile/profile_view.dart';
import 'home_provider.dart';
import '../home_create/home_create_view.dart';
import '../home_detail/home_detail_view.dart';
import '../job_posting/job_posting_view.dart';
import '../news/news_view.dart';
import '../../product/constanst/string_constanst.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).init();
    ref.read(homeProvider.notifier).getListAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: ref.watch(homeProvider.notifier).pageController,
            children: [homeView(context), const JobPostingView(), const NewsView(), const ProfileView()],
          ),
          if (ref.watch(homeProvider).isLoading ?? false) Center(child: CircularProgressIndicator()),
        ],
      ),
      bottomNavigationBar: buttomBar(),
    );
  }

  Column homeView(BuildContext context) {
    return Column(
      children: [
        buildBottomAppBar(context),
        buildPushHomeCreate(context),
        Expanded(
          child: buildListView(),
        ),
      ],
    );
  }

  Padding buildPushHomeCreate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.padding.onlyTopLow.top,
        right: context.padding.onlyLeftHigh.left * 1.4,
      ),
      child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeCreateView()),
            );
          },
          child: Text(
            "Esnaf ilanı vermek için tıklayınız",
            style: Theme.of(context).textTheme.displaySmall,
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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

  Container buildBottomAppBar(BuildContext context) {
    return Container(
        color: Colors.orange,
        width: double.maxFinite,
        height: context.sized.height * 0.035,
        child: Center(
          child: Text(
            StringConstants.titleEsnaf,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ));
  }

  ListView buildListView() {
    final values = ref.read(homeProvider).photos ?? [];
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) => Center(child: buildContainer(context, index)),
    );
  }

  Container buildContainer(BuildContext context, int index) {
    return Container(
      width: context.sized.width * 0.9,
      height: context.sized.height * 0.25,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.orangeAccent,
          width: 2,
        ),
      ),
      child: buildCard(context, index),
    );
  }

  Center buildCard(BuildContext context, int index) {
    final values = ref.watch(homeProvider).photos ?? [];
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeDetailView(values[index].title ?? '', values[index].url ?? '')),
          );
        },
        child: SizedBox(
          width: context.sized.width * 0.9,
          height: context.sized.height * 0.25,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    values[index].url ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                values[index].title ?? '',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttomBar() {
    return CurvedNavigationBar(
      backgroundColor: Colors.orange,
      onTap: (index) {
        ref.watch(homeProvider.notifier).changePage(index);
      },
      items: [
        Image.asset('assets/icons/home.png'),
        Image.asset('assets/icons/Vector.png'),
        Image.asset('assets/icons/building-office.png'),
        Image.asset('assets/icons/user.png'),
      ],
    );
  }
}
