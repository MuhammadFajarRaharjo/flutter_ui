import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductChartTile extends ConsumerWidget {
  const ProductChartTile({
    super.key,
    this.removeButton = false,
    this.trailing,
  });
  final bool removeButton;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.only(top: BoxSize.size12),
      decoration: BoxDecoration(
        color: AppStyle.darkNavy25,
        borderRadius: BorderRadius.circular(BoxSize.radius12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: BoxSize.size16,
        vertical: BoxSize.size10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* TILE PRODUCT
          Row(
            children: [
              //* IMAGE PRODUCT
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(BoxSize.radius12),
                child: Image.asset(
                  Assets.assetsImagesProductsBaskeballShoes23,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),

              //* NAME AND PRICE PRODUCT
              WidthSpacer.from10(),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terrex Urban Low Terrex Urban Low ',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.poppinsSemiBold.copyWith(
                        fontSize: 14,
                        letterSpacing: 0.14,
                      ),
                    ),
                    Text(
                      '\$143,98',
                      style: AppStyle.poppinsRegular
                          .copyWith(fontSize: 14, color: AppStyle.blue2C),
                    ),
                  ],
                ),
              ),

              //* PRODUCT COUNT AND BUTTON COUNT
              WidthSpacer.from10(),
              trailing ?? const SizedBox(),
            ],
          ),

          //* BUTTON REMOVE PRODUCT
          Visibility(
            visible: removeButton,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                iconColor: AppStyle.salmon,
                textStyle: AppStyle.poppinsLight.copyWith(fontSize: 12),
                foregroundColor: AppStyle.salmon,
                padding: EdgeInsets.zero,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              ),
              onPressed: () {},
              icon: const Icon(Icons.delete_forever),
              label: const Text('Remove'),
            ),
          ),
        ],
      ),
    );
  }
}
