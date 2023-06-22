import 'package:flutter/material.dart';
import 'package:home_rent/pages/home/widgets/heading.dart';
import 'package:home_rent/pages/home/widgets/tab_item.dart';

import '../../common/helpers/size_config.dart';
import '../../common/styles/box_style.dart';
import 'page_view_product.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> categories = [
    'House',
    'Apartment',
    'Villa',
    'Hotel',
    'Cotage',
  ];

  late final PageController pageController;
  int initialPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: initialPage);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //* HEADER
              const Heading(),
              const SizedBox(height: BoxStyle.padding16),

              //* CATEGORIES
              SizedBox(
                height: 47,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return TabItem(
                      text: categories[index],
                      isSelected: initialPage == index,
                      onTap: () {
                        setState(() => initialPage = index);
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: BoxStyle.padding10),

              //* PAGEVIEW FROM CATEGORIES
              SizedBox(
                height: SizeConfig.proportionalScreenHeight(100) + (80 * 6),
                child: PageViewProduct(
                  pageController: pageController,
                  categories: categories,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
