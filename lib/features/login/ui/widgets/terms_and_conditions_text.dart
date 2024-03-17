import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.font13GrayRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
