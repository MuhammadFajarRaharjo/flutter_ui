import 'package:expanse/presentation/providers/setup_success_sate.dart';
import 'package:expanse/presentation/routes/app_routes.dart';
import 'package:expanse/presentation/widgets/height_spacer.dart';
import 'package:expanse/utils/constants/colors.dart';
import 'package:expanse/utils/constants/constant.dart';
import 'package:expanse/utils/widgets/blank_page.dart';
import 'package:expanse/utils/widgets/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class SetupPinPage extends ConsumerWidget {
  const SetupPinPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(setupSuccessStateProvider).when(
          data: (setupIsSuccess) => Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin)
                  .copyWith(top: 70),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Let’s  setup your PIN',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: kWhite80),
                    ),
                    const HeightSPacer(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Pinput(
                        animationDuration: const Duration(milliseconds: 10),
                        autofocus: true,
                        showCursor: false,
                        obscureText: true,
                        obscuringCharacter: ' ',
                        onCompleted: (value) => Future.delayed(
                          const Duration(microseconds: 100),
                          () {
                            if (setupIsSuccess) {
                              return Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.main,
                              );
                            }
                            return Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.setupAccount,
                            );
                          },
                        ),
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        defaultPinTheme: PinTheme(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kViolet20, width: 2),
                          ),
                          height: 32,
                        ),
                        submittedPinTheme: const PinTheme(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kWhite80,
                          ),
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          error: (error, _) => ErrorPage(message: error.toString()),
          loading: () => const BlankPage(),
        );
  }
}
