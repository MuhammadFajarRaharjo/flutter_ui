import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/pc_overflow_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_button_icon_filled.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCardOverflow extends ConsumerWidget {
  const ProductCardOverflow({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.all(BoxSize.size10),
      height: 74,
      width: BoxSize.proportionalWidth(context, 70),
      decoration: BoxDecoration(
        color: AppStyle.purple.withOpacity(0.24),
        borderRadius: BorderRadius.circular(BoxSize.radius12),
        border: Border.all(
          color: AppStyle.purple,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(BoxSize.radius12),
                  child: Image.asset(
                    Assets.assetsImagesShoes,
                    width: 54,
                  ),
                ),
                WidthSpacer.from10(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COURT VISIO kjdnf askdjfa aksjd  dsfjasd',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.poppinsRegular.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      HeightSpacer.from5(),
                      Text(
                        '\$57,15',
                        style: AppStyle.poppinsMedium.copyWith(
                          color: AppStyle.blue2C,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomIconButtonFilled(
            icon: Icons.close,
            onPressed: () {
              ref
                  .read(pCOverflowVisibleStateProvider(key: const Key('store1'))
                      .notifier)
                  .hidden();
            },
            iconColor: AppStyle.darkNavy1F,
          ),
          // IconButton.filled(
          //   visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          //   padding: const EdgeInsets.all(0),
          //   color: AppStyle.darkNavy1F,
          //   style: IconButton.styleFrom(backgroundColor: AppStyle.purple),
          //   iconSize: 20,
          //   onPressed: () => ref
          //       .read(pCOverflowVisibleStateProvider(key: const Key('store1'))
          //           .notifier)
          //       .hidden(),
          //   icon: const Icon(
          //     Icons.close,
          //   ),
          // ),
        ],
      ),
    );
  }
}
