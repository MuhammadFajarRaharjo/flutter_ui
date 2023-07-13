import 'package:ecommers_and_chat_app_with_bwa/presentation/models/product_model.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';

class PopularProductCard extends StatelessWidget {
  const PopularProductCard({
    super.key,
    required this.index,
    required this.product,
  });
  final int index;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteName.product),
      child: Container(
        width: 215,
        margin: EdgeInsets.only(
          left: index == 0 ? BoxSize.size30 : 0,
          right: BoxSize.size30,
        ),
        decoration: ShapeDecoration(
          color: AppStyle.whiteEC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: BoxSize.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.poster,
              height: 145,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: BoxSize.size20),
              child: Text(
                product.categorie,
                style: AppStyle.poppinsRegular.copyWith(
                  fontSize: 12,
                  color: AppStyle.grey99,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: BoxSize.size20),
              child: Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.poppinsSemiBold.copyWith(
                  color: const Color(0xFF2E2E2E),
                  fontSize: 18,
                  letterSpacing: 0.18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: BoxSize.size20),
              child: Text(
                product.price,
                style: AppStyle.poppinsMedium.copyWith(
                  color: const Color(0xFF2C96F1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
