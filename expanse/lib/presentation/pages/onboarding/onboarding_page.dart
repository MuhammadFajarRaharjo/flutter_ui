import 'package:expanse/utils/constants/colors.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constants/assets.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 470,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _onboardingContent(
                        assetImage: Assets.assetsImagesIllustration2,
                        title: 'Gain total control of your money',
                        subtitle:
                            'Become your own money manager and make every cent count',
                      ),
                      _onboardingContent(
                        assetImage: Assets.assetsImagesIllustration1,
                        title: 'Know where your money goes',
                        subtitle:
                            'Track your transaction easily, with categories and financial report ',
                      ),
                      _onboardingContent(
                        assetImage: Assets.assetsImagesIllustration,
                        title: 'Planning ahead',
                        subtitle:
                            'Setup your budget for each category so you in control',
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TabPageSelector(
                    controller: _tabController,
                    selectedColor: kPrimaryColor,
                    color: kTextSecondary,
                    borderStyle: BorderStyle.none,
                  ),
                ),
                HeightSPacer.from20(),
                CustomFilledButton(
                  text: 'Sign Up',
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.signUp),
                ),
                HeightSPacer.from20(),
                CustomFilledButton(
                  text: 'Login',
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.login),
                  isPrimary: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _onboardingContent({
    required String assetImage,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(kMargin20).copyWith(bottom: 0),
      child: Column(
        children: [
          Image.asset(assetImage),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          HeightSPacer.from10(),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: kTextSecondary),
          )
        ],
      ),
    );
  }
}
