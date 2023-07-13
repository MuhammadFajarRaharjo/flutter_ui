import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/box_size.dart';
import '../../../utils/constants/navigation_page.dart';
import '../../../utils/style/app_style.dart';
import '../../providers/navigation_state.dart';
import '../../widgets/width_spacer.dart';
import 'chat/chat_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';
import 'wishlist/wishlist_page.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: PageView.custom(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        childrenDelegate: SliverChildListDelegate(
          [
            const HomePage(),
            const ChatPage(),
            const WishlistPage(),
            const ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(ref),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _fab(context),
    );
  }

  FloatingActionButton _fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, RouteName.chart),
      backgroundColor: AppStyle.blue38,
      shape: const CircleBorder(),
      child: SvgPicture.asset(Assets.assetsSvgCart),
    );
  }

  /// Bottom nabigation noutched bar
  Widget _bottomNavigationBar(WidgetRef ref) {
    final selectedPage = ref.watch(navigationStateProvider);
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(BoxSize.radius30),
      ),
      child: BottomAppBar(
        color: AppStyle.darkNavy25,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            _buildIconButton(
              ref: ref,
              page: NavigationPage.home,
              svg: Assets.assetsSvgHome,
              selectedPage: selectedPage,
            ),
            WidthSpacer.from20(),
            _buildIconButton(
              ref: ref,
              page: NavigationPage.chat,
              svg: Assets.assetsSvgChat,
              selectedPage: selectedPage,
            ),
            const Spacer(),
            _buildIconButton(
              ref: ref,
              page: NavigationPage.wishlist,
              svg: Assets.assetsSvgWishlist,
              selectedPage: selectedPage,
            ),
            WidthSpacer.from20(),
            _buildIconButton(
              ref: ref,
              page: NavigationPage.profile,
              svg: Assets.assetsSvgPerson2,
              selectedPage: selectedPage,
            ),
          ],
        ),
      ),
    );
  }

  /// IconButton BottomNavigationBar
  IconButton _buildIconButton({
    required WidgetRef ref,
    required NavigationPage selectedPage,
    required String svg,
    required NavigationPage page,
  }) {
    return IconButton(
      onPressed: () {
        pageController.animateToPage(
          page.index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
        ref.read(navigationStateProvider.notifier).setPage(page);
      },
      icon: SvgPicture.asset(
        svg,
        colorFilter: selectedPage == page
            ? const ColorFilter.mode(AppStyle.purple, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
