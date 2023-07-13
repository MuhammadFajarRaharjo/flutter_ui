import 'package:flutter/material.dart';

import '../../../../../utils/constants/assets.dart';
import '../../../../../utils/constants/box_size.dart';
import '../../../../../utils/style/app_style.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          color: Color(0xFF2B2839),
          width: 2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0)
          .copyWith(top: BoxSize.size16),
      title: Text(
        'Shoe Store',
        style: AppStyle.poppinsRegular.copyWith(fontSize: 15),
      ),
      subtitle: Text(
        'Good night, This item is on store',
        overflow: TextOverflow.ellipsis,
        style: AppStyle.poppinsLight.copyWith(
          color: AppStyle.grey99,
          fontSize: 14,
        ),
      ),
      leading: const CircleAvatar(
        backgroundColor: AppStyle.darkNavy25,
        backgroundImage: AssetImage(Assets.assetsImagesShopLogo),
        radius: 27,
      ),
      trailing: Text(
        'Now',
        style: AppStyle.poppinsRegular.copyWith(
          color: AppStyle.grey99,
          fontSize: 10,
        ),
      ),
    );
  }
}
