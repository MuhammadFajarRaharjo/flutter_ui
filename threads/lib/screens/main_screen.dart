import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/providers/current_page_state.dart';
import 'package:threads/routes/app_routes.dart';
import 'package:threads/screens/activity/activity_screen.dart';
import 'package:threads/screens/home/home_scren.dart';
import 'package:threads/screens/profile/profile_screen.dart';
import 'package:threads/screens/search/search_screen.dart';
import 'package:threads/utils/assets.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: ref.read(currentPageStateProvider),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void setPage(int page) {
    ref.read(currentPageStateProvider.notifier).setPage(page);
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); //* Keluar dari aplikasi
        return false;
      },
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            HomeScreen(),
            SearchScreen(),
            ActivityScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    final currentPage = ref.watch(currentPageStateProvider);
    return BottomAppBar(
      elevation: 0,
      height: kBottomNavigationBarHeight,
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => setPage(0),
            icon: SvgPicture.asset(
              currentPage == 0
                  ? Assets.assetsIconsHomeSelected
                  : Assets.assetsIconsHome,
            ),
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => setPage(1),
            icon: SvgPicture.asset(
              currentPage == 1
                  ? Assets.assetsIconsSearchSelected
                  : Assets.assetsIconsSearch,
            ),
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.create),
            icon: SvgPicture.asset(Assets.assetsIconsCreate),
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => setPage(2),
            icon: SvgPicture.asset(
              currentPage == 2
                  ? Assets.assetsIconsHeartSelected
                  : Assets.assetsIconsHeartNavigation,
            ),
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => setPage(4),
            icon: SvgPicture.asset(
              currentPage == 4
                  ? Assets.assetsIconsUserSelected
                  : Assets.assetsIconsUser,
            ),
          ),
        ],
      ),
    );
  }
}
