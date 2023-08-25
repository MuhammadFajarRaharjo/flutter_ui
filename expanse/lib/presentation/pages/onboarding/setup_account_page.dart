import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:flutter/material.dart';

class SetupAccountPage extends StatelessWidget {
  const SetupAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefaultMargin),
        child: Column(
          children: [
            const HeightSPacer(height: 60),
            const Text(
              'Let’s setup your account!',
              style: TextStyle(fontSize: 36),
            ),
            HeightSPacer.from30(),
            const Text(
              'Account can be your bank, credit card or your wallet.',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            CustomFilledButton(
              text: 'Let’s go',
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.addNewAccount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
