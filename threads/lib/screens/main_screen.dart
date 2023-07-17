import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/screens/activity/activity_screen.dart';
import 'package:threads/screens/create/create_screen.dart';
import 'package:threads/screens/home/home_scren.dart';
import 'package:threads/screens/profile/profile_screen.dart';
import 'package:threads/screens/search/search_screen.dart';
import 'package:threads/utils/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void setPage(int page) {
    setState(() => currentPage = page);
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeScreen(),
          SearchScreen(),
          CreateScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => setPage(0),
            icon: SvgPicture.asset(
              currentPage == 0
                  ? Assets.assetsIconsHomeSelected
                  : Assets.assetsIconsHome,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => setPage(1),
            icon: SvgPicture.asset(
              currentPage == 1
                  ? Assets.assetsIconsSearchSelected
                  : Assets.assetsIconsSearch,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => setPage(2),
            icon: SvgPicture.asset(
              currentPage == 2
                  ? Assets.assetsIconsCreateSelected
                  : Assets.assetsIconsCreate,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => setPage(3),
            icon: SvgPicture.asset(
              currentPage == 3
                  ? Assets.assetsIconsHeartSelected
                  : Assets.assetsIconsHeartNavigation,
              height: 24,
              width: 24,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () => setPage(4),
            icon: SvgPicture.asset(
              currentPage == 4
                  ? Assets.assetsIconsUserSelected
                  : Assets.assetsIconsUser,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
