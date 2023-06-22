import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent/common/styles/box_style.dart';

import '../../../common/constants/assets.dart';
import '../../../common/constants/my_colors.dart';
import '../../../common/styles/app_styles.dart';
import '../../../common/styles/font_styles.dart';

class Heading extends StatefulWidget {
  const Heading({super.key});

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  late final TextEditingController inputController;

  final List<String> locations = [
    'Jakarta',
    'Tangrang',
    'Semarang',
    'Surabaya',
    'Bali',
  ];
  late String currentLocation;

  @override
  void initState() {
    super.initState();
    currentLocation = locations.first;
    inputController = TextEditingController();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: BoxStyle.padding20)
          .copyWith(top: BoxStyle.padding16),
      child: Column(
        children: [
          //* LOCATION TEXT AND NOTIFY
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: FontStyles.ralewayRegular12.copyWith(
                      color: MyColors.grey83,
                    ),
                  ),
                  const SizedBox(height: BoxStyle.padding4),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(
                      BoxStyle.borderRadius5,
                    ),
                    underline: Container(),
                    isDense: true,
                    style: FontStyles.ralewayMedium20
                        .copyWith(color: Colors.black),
                    elevation: 0,
                    icon: SvgPicture.asset(Assets.iconDropdown),
                    value: currentLocation,
                    items: locations
                        .map(
                          (location) => DropdownMenuItem<String>(
                            value: location,
                            child: Text(
                              location,
                              // style: ,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => setState(() {
                      currentLocation = value!;
                    }),
                  ),
                ],
              ),
              SvgPicture.asset(Assets.iconNotificationHasNotif),
            ],
          ),
          const SizedBox(height: BoxStyle.padding16),
          //* SEARCH ADDRESS
          Row(
            children: [
              //* TEXT FIELD
              Expanded(
                child: TextField(
                  style: FontStyles.ralewayRegular,
                  controller: inputController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: BoxStyle.padding16,
                      vertical: BoxStyle.padding12,
                    ),
                    isDense: true,
                    enabledBorder: AppStyles.inputBorder,
                    border: AppStyles.inputBorder,
                    disabledBorder: AppStyles.inputBorder,
                    errorBorder: AppStyles.inputBorder.copyWith(
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: AppStyles.inputBorder,
                    filled: true,
                    fillColor: MyColors.whiteF7,
                    hintText: 'Search address or near you',
                    hintStyle: FontStyles.ralewayRegular
                        .copyWith(color: MyColors.grey85),
                    prefixIcon: SvgPicture.asset(
                      Assets.iconSearch,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: BoxStyle.padding8),

              //* BOTTON FILTER
              Container(
                padding: const EdgeInsets.all(BoxStyle.padding12),
                decoration: BoxDecoration(
                  gradient: AppStyles.linearGradientBlue,
                  borderRadius: BorderRadius.circular(BoxStyle.borderRadius10),
                ),
                child: SvgPicture.asset(
                  Assets.iconFilter,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
