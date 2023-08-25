import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/custom_app_bar.dart';
import 'package:expanse/presentation/widgets/custom_filled_button.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/constants/colors.dart';
import '../providers/auth_page_state.dart';
import 'widgets/countdown.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  Duration time = const Duration(minutes: 5);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Verification'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: ListView(
            children: [
              HeightSPacer.from20(),
              const Text(
                'Enter your Verification Code',
                style: TextStyle(fontSize: 36),
              ),
              HeightSPacer.from20(),

              //* PIN INPUT
              Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.start,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  scrollPadding: EdgeInsets.zero,
                  autofocus: true,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                  ),
                  followingPinTheme: PinTheme(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kWhite20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    height: 16,
                  ),
                  focusedPinTheme: PinTheme(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),

              //* time
              HeightSPacer.from20(),
              Countdown(
                targetTime: DateTime.now().add(time),
              ),

              //* SEND EMAIL TEXT
              HeightSPacer.from10(),
              RichText(
                text: TextSpan(
                  text: 'We send verification code to your email ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16),
                  children: const [
                    TextSpan(
                      text: 'brajaoma*****@gmail.com. ',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    TextSpan(text: 'You can check your inbox.'),
                  ],
                ),
              ),

              //* TEXT SEND VERIFICATION TO EMAIL
              HeightSPacer.from10(),
              RichText(
                text: TextSpan(
                  text: 'I didn’t received the code? Send again',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: kPrimaryColor,
                        decoration: TextDecoration.underline,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => setState(() {}),
                ),
              ),
              //* BUTTON VERIFICATION
              HeightSPacer.from30(),
              Consumer(
                builder: (context, ref, child) => CustomFilledButton(
                  text: 'Verify',
                  onPressed: () {
                    ref.read(authPageStateProvider.notifier).setAuth(true);

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.setupPin,
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
