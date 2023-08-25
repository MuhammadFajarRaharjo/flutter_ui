import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomCheckListTile extends StatefulWidget {
  const CustomCheckListTile({
    super.key,
  });

  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isCheck,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(color: kPrimaryColor, width: 2),
      visualDensity: VisualDensity.compact,
      title: RichText(
        text: TextSpan(
          text: 'By signing up, you agree to the ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: 'Terms of Service and Privacy Policy',
              recognizer: TapGestureRecognizer()..onTap = () {},
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kPrimaryColor),
            ),
          ],
        ),
      ),
      onChanged: (value) => setState(() => isCheck = value!),
    );
  }
}
