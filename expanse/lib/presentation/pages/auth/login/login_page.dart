import 'package:expanse/utils/constants/assets.dart';
import 'package:expanse/utils/constants/colors.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:expanse/presentation/widgets/custom_text_form_field.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:expanse/presentation/widgets/svg_asset.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/app_routes.dart';
import '../providers/auth_page_state.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const SvgAsset(
            Assets.assetsIconsArrowLeft,
            color: kTextPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultMargin),
        child: ListView(
          children: [
            //* TEXT FORM FIELD
            const HeightSPacer(height: 40),
            const CustomTextFormField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            HeightSPacer.from20(),
            const CustomTextFormField(hint: 'Password', isPasswordType: true),

            //* BUTTON LOGIN
            HeightSPacer.from30(),
            CustomFilledButton(
              text: 'Login',
              onPressed: () {
                ref.read(authPageStateProvider.notifier).setAuth(true);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.setupPin,
                  (route) => false,
                );
              },
            ),

            //* TEXT TO RESET PASSWORD
            HeightSPacer.from20(),
            RichText(
              text: TextSpan(
                text: 'Forgot Password?',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: kPrimaryColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      Navigator.pushNamed(context, AppRoutes.forgotPassword),
              ),
              textAlign: TextAlign.center,
            ),

            //* TEXT TO SIGNUP
            HeightSPacer.from20(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Don’t have an account yet? ',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: kTextSecondary, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.pushNamed(context, AppRoutes.signUp),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: kPrimaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
