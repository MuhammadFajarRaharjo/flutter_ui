import 'package:expanse/presentation/style/app_text_style.dart';
import 'package:expanse/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/constant.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_check_list_tile.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/height_spacer.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sign Up'),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultMargin),
        child: ListView(
          children: [
            //* TEXT FORM FIELD
            const HeightSPacer(height: 40),
            const CustomTextFormField(hint: 'Name'),
            HeightSPacer.from20(),
            const CustomTextFormField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            HeightSPacer.from20(),
            const CustomTextFormField(hint: 'Password', isPasswordType: true),

            //* CHECKBOX TERMS AND POLICY
            HeightSPacer.from10(),
            const CustomCheckListTile(),

            //* SIGNUP BUTTON
            HeightSPacer.from10(),
            CustomFilledButton(
              text: 'Sign Up',
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.verification),
            ),

            HeightSPacer.from10(),
            Text(
              textAlign: TextAlign.center,
              'Or With',
              style: interBold.copyWith(color: kTextSecondary),
            ),

            //* GOOGLE BUTTON
            HeightSPacer.from10(),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: kWhite60,
                foregroundColor: kTextPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                ),
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18),
                padding: const EdgeInsets.symmetric(vertical: 13),
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.verification,
              ),
              icon: SvgPicture.asset(Assets.assetsIconsGoogle),
              label: const Text('Sign Up with Google'),
            ),

            //* TEXT TO LOGIN
            HeightSPacer.from20(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: kTextSecondary, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.pushNamed(context, AppRoutes.login),
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
