import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent/common/constants/assets.dart';
import 'package:home_rent/common/constants/my_colors.dart';
import 'package:home_rent/common/styles/box_style.dart';
import 'package:home_rent/common/styles/font_styles.dart';

import '../../common/styles/app_styles.dart';

class HouseDetail extends StatelessWidget {
  const HouseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: _bottom(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: BoxStyle.padding20),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              _houseImage(context),

              //* DESCTIPTION
              Text('Description', style: FontStyles.ralewayMedium16),
              const SizedBox(height: BoxStyle.padding12),
              RichText(
                text: TextSpan(
                  text:
                      'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... ',
                  style: FontStyles.ralewayMedium12.copyWith(
                    color: MyColors.grey85,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'Show More',
                      style: FontStyles.ralewayMedium12
                          .copyWith(color: MyColors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),

              //* OWNER TILE
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: BoxStyle.padding6,
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(Assets.imagesUserImage),
                  backgroundColor: MyColors.grey,
                ),
                title: Text('Garry Alen', style: FontStyles.ralewayMedium12),
                subtitle: Text(
                  'Owner',
                  style: FontStyles.ralewayRegular12
                      .copyWith(color: MyColors.grey85),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //* BUTTON CALL
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.iconPhone,
                        fit: BoxFit.none,
                      ),
                      style: IconButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        iconSize: 12,
                        fixedSize: const Size(24, 24),
                        padding: const EdgeInsets.all(BoxStyle.padding8),
                        backgroundColor: MyColors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(BoxStyle.borderRadius5),
                        ),
                      ),
                    ),
                    //* BUTTON MESSAGE
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.iconMessage,
                        fit: BoxFit.none,
                      ),
                      style: IconButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        iconSize: 12,
                        fixedSize: const Size(24, 24),
                        padding: const EdgeInsets.all(BoxStyle.padding8),
                        backgroundColor: MyColors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(BoxStyle.borderRadius5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //* LIST GALLERY
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Gallery', style: FontStyles.ralewayMedium16),
              ),
              const SizedBox(height: BoxStyle.borderRadius20),
              SizedBox(
                height: 74,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                    width: 74,
                    margin: index != 3
                        ? const EdgeInsets.only(right: BoxStyle.padding12)
                        : null,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(BoxStyle.borderRadius10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/gallery_${index + 1}.jpeg'),
                      ),
                    ),
                  ),
                ),
              ),

              //* MAPS
              Container(
                margin:
                    const EdgeInsets.only(top: BoxStyle.padding32, bottom: 90),
                width: double.infinity,
                height: 151,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(BoxStyle.borderRadius20),
                  image: const DecorationImage(
                    image: AssetImage(Assets.imagesMapSample),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _houseImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: BoxStyle.padding20)
          .copyWith(bottom: 15),
      height: 304,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 15),
            spreadRadius: -8,
            blurRadius: 18,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
        borderRadius: BorderRadius.circular(BoxStyle.padding20),
        //* BACKGROUND IMAGE
        image: const DecorationImage(
          image: AssetImage(Assets.imagesHouseImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          //* Background Gradient
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 319 / 2,
              decoration: BoxDecoration(
                gradient: AppStyles.sinearGradientBlack,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(BoxStyle.borderRadius20),
                ),
              ),
            ),
          ),

          //* CONTAIN
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(BoxStyle.padding20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* TOP BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //* BUTTON BACK
                      SizedBox(
                        height: 34,
                        width: 34,
                        child: ClipOval(
                          child: IconButton.filled(
                            style: IconButton.styleFrom(
                                backgroundColor:
                                    Colors.black.withOpacity(0.24)),
                            padding: const EdgeInsets.all(
                              BoxStyle.padding4,
                            ),
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(
                              Assets.iconArrowBack,
                            ),
                          ),
                        ),
                      ),

                      //* BUTTON SAVE
                      SizedBox(
                        height: 34,
                        width: 34,
                        child: ClipOval(
                          child: IconButton.filled(
                            style: IconButton.styleFrom(
                                backgroundColor:
                                    Colors.black.withOpacity(0.24)),
                            padding: const EdgeInsets.all(
                              BoxStyle.padding4,
                            ),
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(
                              Assets.iconBookmark,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //* TEXT BOTTOM
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dreamsville House',
                        style: FontStyles.ralewaySemibold20
                            .copyWith(color: Colors.white),
                      ),

                      Text(
                        'Jl. Sultan Iskandar Muda, Jakarta selatan',
                        style: FontStyles.ralewayRegular
                            .copyWith(color: MyColors.greyD4),
                      ),
                      const SizedBox(height: BoxStyle.padding18),
                      //* ICON
                      Row(
                        children: [
                          //* ICON AND TEXT BEDROOM
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(BoxStyle.borderRadius5),
                              color: Colors.black.withOpacity(0.24),
                            ),
                            margin: const EdgeInsets.only(
                                right: BoxStyle.padding12),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.iconBedroomWhite,
                              ),
                            ),
                          ),
                          Text(
                            '6 Bedroom',
                            style: FontStyles.ralewayRegular12
                                .copyWith(color: MyColors.greyD4),
                          ),

                          const SizedBox(width: BoxStyle.padding32),
                          //* ICON AND TEXT BATHROOM
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(BoxStyle.borderRadius5),
                              color: Colors.black.withOpacity(0.24),
                            ),
                            margin: const EdgeInsets.only(
                                right: BoxStyle.padding12),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.iconBathroomWhite,
                              ),
                            ),
                          ),
                          Text(
                            '3 Bethroom',
                            style: FontStyles.ralewayRegular12
                                .copyWith(color: MyColors.greyD4),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _bottom() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: BoxStyle.padding20,
        vertical: BoxStyle.padding32,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppStyles.linearGradientWhite,
      ),
      child: Row(
        children: [
          //* TEXT PRICE
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: FontStyles.ralewayRegular12
                      .copyWith(color: MyColors.grey85),
                ),
                const SizedBox(height: BoxStyle.padding8),
                Text(
                  'Rp. 2.500.000.000 / Year',
                  style: FontStyles.ralewayMedium16,
                ),
              ],
            ),
          ),

          //* BOTTON BOOKING
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BoxStyle.borderRadius10),
              gradient: AppStyles.linearGradientBlue,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.4),
                  blurRadius: 18,
                  spreadRadius: -7,
                  offset: const Offset(0, 13),
                )
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                splashFactory: InkSplash.splashFactory,
                padding: const EdgeInsets.symmetric(
                  horizontal: BoxStyle.padding16,
                  vertical: BoxStyle.padding10,
                ),
                shadowColor: Colors.transparent,
                elevation: 0,
                alignment: Alignment.center,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    BoxStyle.borderRadius10,
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Rent Now',
                style: FontStyles.ralewaySemibold
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
