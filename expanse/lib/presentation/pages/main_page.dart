import 'dart:math';

import 'package:expanse/presentation/pages/home/home_page.dart';
import 'package:expanse/presentation/pages/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../providers/bottom_nav_bar_state.dart';
import '../providers/fab_expanded_state.dart';
import '../widgets/fab.dart';
import '../widgets/svg_asset.dart';
import '../widgets/width_spacer.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                HomePage(),
                TransactionPage(),
              ],
            ),
            const Align(
              alignment: Alignment(0, 1.1),
              child: FabExpanded(),
            ),
          ],
        ),
        floatingActionButton: _fab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _bottomNavBar() {
    final currentPage = ref.watch(bottomNavBarStateProvider);

    Color pageColor(int index) {
      return currentPage == index ? kPrimaryColor : kTextSecondary;
    }

    void setPage(int index) {
      ref.read(bottomNavBarStateProvider.notifier).setPage(index);
      _pageController.jumpToPage(index);
    }

    return BottomAppBar(
      color: kViolet20,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => setPage(0),
            icon: SvgAsset(
              Assets.assetsIconsHome,
              color: pageColor(0),
            ),
          ),
          IconButton(
            onPressed: () => setPage(1),
            icon: SvgAsset(
              Assets.assetsIconsTransaction,
              color: pageColor(1),
            ),
          ),
          WidthSpacer.from10(),
          IconButton(
            onPressed: () => setPage(2),
            icon: SvgAsset(
              Assets.assetsIconsPieChart,
              color: pageColor(2),
            ),
          ),
          IconButton(
            onPressed: () => setPage(3),
            icon: SvgAsset(
              Assets.assetsIconsUser,
              color: pageColor(3),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _fab() {
    final isExpand = ref.watch(fabExpandedStateProvider);
    return FloatingActionButton(
      shape: const CircleBorder(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) => Transform.rotate(
          angle: _animation.value * pi * (3 / 4),
          child: const Icon(Icons.add, size: 40),
        ),
      ),
      onPressed: () {
        ref.read(fabExpandedStateProvider.notifier).toogle();
        if (!isExpand) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
    );
  }
}
