import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterdelivery1/authentication/policy_dialog.dart';

import '../widget/widget_support.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
       textAlign: TextAlign.end,
        text: TextSpan(
          text: "بإنشاء حساب توافق على",
          style:AppWidget.semiBoldTextFeildStyle14(),
          children: [
            TextSpan(
              text: " الشروط والأحكام",
              style:AppWidget.semiBoldTextFeildStyle121(),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showModal(
                    context: context,
                    configuration: FadeScaleTransitionConfiguration(),
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'terms_and_conditions.md',
                      );
                    },
                  );
                },
            ),

          ],
        ),
      ),
    );
  }
}