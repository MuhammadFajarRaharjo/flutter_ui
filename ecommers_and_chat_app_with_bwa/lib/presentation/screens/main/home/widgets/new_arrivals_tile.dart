import 'package:ecommers_and_chat_app_with_bwa/presentation/models/product_model.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class NewArrivalsTile extends StatelessWidget {
  const NewArrivalsTile({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: BoxSize.size22),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BoxSize.size20),
              color: AppStyle.whiteEC,
              image: DecorationImage(
                image: AssetImage(product.poster),
              ),
            ),
            height: 120,
            width: 120,
          ),
          const WidthSpacer(width: BoxSize.size12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.categorie,
                  style: AppStyle.poppinsRegular.copyWith(
                    color: AppStyle.grey99,
                    fontSize: 12,
                  ),
                ),
                Text(
                  product.title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyle.poppinsSemiBold.copyWith(
                    fontSize: 16,
                    letterSpacing: 0.16,
                  ),
                ),
                Text(
                  product.price,
                  style: AppStyle.poppinsMedium.copyWith(
                    color: AppStyle.blue2C,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
