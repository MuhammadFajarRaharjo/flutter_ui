import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant.dart';
import '../../providers/setup_success_sate.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/height_spacer.dart';
import '../../widgets/svg_asset.dart';

class AddNewAccountPage extends StatefulWidget {
  const AddNewAccountPage({super.key});

  @override
  State<AddNewAccountPage> createState() => _AddNewAccountPageState();
}

class _AddNewAccountPageState extends State<AddNewAccountPage>
    with WidgetsBindingObserver {
  late final TextEditingController _controller;
  final listBank = [
    Assets.assetsImagesBank,
    Assets.assetsImagesBank1,
    Assets.assetsImagesBank2,
    Assets.assetsImagesBank3,
    Assets.assetsImagesBank4,
    Assets.assetsImagesBank5,
    Assets.assetsImagesBank6,
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //* Untuk mendengarkan perubahan dimensi pada layar
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    //* mendengarkan perubahan tampilan pada bagian bawah
    if (MediaQuery.viewInsetsOf(context).bottom != 0) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        appBar: const CustomAppBar(
          title: 'Add New Account',
          foregroundColor: kWhite80,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _infoBalance(),
            _bottomSeed(),
          ],
        ),
      ),
    );
  }

  Padding _infoBalance() {
    return Padding(
      padding: const EdgeInsets.all(kDefaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: TextStyle(color: kWhite80.withOpacity(0.64), fontSize: 18),
          ),
          const Text(
            '\$00.0',
            style: TextStyle(fontSize: 64, color: kWhite80),
          ),
        ],
      ),
    );
  }

  BottomSheet _bottomSeed() {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      constraints: BoxConstraints(
        //* batasi tinggi agar tidak overload pixel
        maxHeight: MediaQuery.sizeOf(context).height / 1.7,
      ),
      //* Gunakan SingleChildScrollView dibandingkan ListView
      //* agar maxHeight dan minHeight bekerja dengan baik
      builder: (context) => SingleChildScrollView(
        child: Column(
          children: [
            _textInput(),
            if (_controller.text != '') _listBank(context),
            Padding(
              padding: const EdgeInsets.all(kDefaultMargin),
              child: Consumer(
                builder: (context, ref, child) => CustomFilledButton(
                  text: 'Continue',
                  onPressed: () {
                    ref
                        .read(setupSuccessStateProvider.notifier)
                        .setStatus(true);

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.setupSuccess,
                      (route) => false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _textInput() {
    return Padding(
      padding: const EdgeInsets.all(kDefaultMargin),
      child: Column(
        children: [
          const CustomTextFormField(hint: 'Name'),
          HeightSPacer.from20(),
          CustomTextFormField(
            readOnly: true,
            controller: _controller,
            hint: 'Account Type',
            prefixIcon: PopupMenuButton<String>(
              icon: const SvgAsset(
                Assets.assetsIconsArrowIosDown,
                color: kTextSecondary,
              ),
              onSelected: (value) {
                _controller.text = value;
                setState(() {});
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'Bank', child: Text('Bank')),
                const PopupMenuItem(
                  value: 'Wallet',
                  child: Text('Wallet'),
                ),
                const PopupMenuItem(
                  value: 'Minimarket',
                  child: Text('Minimarket'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _listBank(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightSPacer.from10(),
          Text(
            _controller.text,
            // style: const TextStyle(fontSize: 16),
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          HeightSPacer.from10(),
          Wrap(
            children: [
              ...listBank
                  .map(
                    (value) => Container(
                      width: MediaQuery.sizeOf(context).width / 3.6,
                      height: 60,
                      padding: const EdgeInsets.all(kDefaultMargin),
                      margin: const EdgeInsets.only(right: 12, bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        color: kWhite60,
                      ),
                      child: Image.asset(value),
                    ),
                  )
                  .toList(),
              Container(
                width: MediaQuery.sizeOf(context).width / 3.6,
                height: 60,
                padding: const EdgeInsets.all(kDefaultMargin),
                margin: const EdgeInsets.only(right: 12, bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  color: kViolet20,
                ),
                child: const Center(
                  child: Text(
                    'See More',
                    style: TextStyle(
                      fontSize: 13,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
