import 'package:expanse/utils/constants/assets.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:flutter/material.dart';

class SuccessSendToEmailPage extends StatelessWidget {
  const SuccessSendToEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefaultMargin),
        child: Column(
          children: [
            const HeightSPacer(height: 40),
            Image.asset(Assets.assetsImagesIllustration3),
            Text(
              'Your email is on the way',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
            ),
            HeightSPacer.from20(),
            const Text(
              textAlign: TextAlign.center,
              'Check your email test@test.com and follow the instructions to reset your password',
              style: TextStyle(fontSize: 16),
            ),

            //* BUTTON BACK TO LOGIN
            const Spacer(),
            CustomFilledButton(
              text: 'Back to Login',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
