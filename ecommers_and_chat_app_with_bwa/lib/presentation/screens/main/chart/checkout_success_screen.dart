import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

import '../../../routes/route_name.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/height_spacer.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Checkout Success')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: BoxSize.proportionalWidth(context, 20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.assetsImagesCart,
                height: 80,
                width: 80,
              ),
              HeightSpacer.from20(),
              Text(
                'You made a transaction',
                textAlign: TextAlign.center,
                style: AppStyle.poppinsMedium,
              ),
              HeightSpacer.from5(),
              Text(
                'Stay at home while we prepare your dream shoes',
                textAlign: TextAlign.center,
                style: AppStyle.poppinsRegular.copyWith(
                  fontSize: 14,
                  color: AppStyle.grey99,
                ),
              ),
              HeightSpacer.from20(),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.main,
                          (route) => false,
                        );
                      },
                      child: const Text('Order Other Shoes'),
                    ),
                  ),
                ],
              ),
              HeightSpacer.from20(),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppStyle.darkGrey39,
                        textStyle: AppStyle.poppinsMedium
                            .copyWith(color: AppStyle.greyB7),
                        // fixedSize: const Size(196, 44),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.chart,
                          (route) => false,
                        );
                      },
                      child: const Text('View My Order'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
