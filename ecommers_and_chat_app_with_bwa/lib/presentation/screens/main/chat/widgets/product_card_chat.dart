import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/height_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class ProductCardChat extends StatelessWidget {
  const ProductCardChat({super.key, this.isSender = true});
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          //! Masih harus di perbaiki marginnya, agar tidak selalu 30
          margin: const EdgeInsets.only(top: BoxSize.size30),
          padding: const EdgeInsets.all(BoxSize.size12),
          width: BoxSize.proportionalWidth(context, 65),
          decoration: BoxDecoration(
            color: AppStyle.purple.withOpacity(0.24),
            borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(BoxSize.radius12))
                .copyWith(
              topLeft: isSender
                  ? const Radius.circular(BoxSize.radius12)
                  : Radius.zero,
              topRight: isSender
                  ? Radius.zero
                  : const Radius.circular(BoxSize.radius12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //* PRODUCT DETAIL
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(BoxSize.radius12),
                    child: Image.asset(
                      Assets.assetsImagesShoes,
                      width: 70,
                      height: 70,
                    ),
                  ),
                  WidthSpacer.from10(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'COURT VISION 2.0 SHOES',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppStyle.poppinsRegular.copyWith(
                            fontSize: 14,
                            letterSpacing: 0.14,
                          ),
                        ),
                        Text(
                          '\$57,15',
                          style: AppStyle.poppinsMedium.copyWith(
                            color: AppStyle.blue2C,
                            letterSpacing: 0.14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              HeightSpacer.from10(),

              //* BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(),
                    onPressed: () {},
                    child: const Text('Add to Cart'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: Text(
                      'Buy Now',
                      style: AppStyle.poppinsMedium
                          .copyWith(fontSize: 14, color: AppStyle.darkNavy1F),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
