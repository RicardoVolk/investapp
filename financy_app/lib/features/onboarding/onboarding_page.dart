import 'dart:developer';

import 'package:financy_app/common/constats/app_colors.dart';
import 'package:financy_app/common/constats/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/multi_text_button_widget.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Expanded(
              child: Container(
                color: AppColors.iceWhite,
                child: Image.asset('assets/images/onboarding_image.png'),
              ),
            ),
            Text(
              'Spend Smarter',
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greelightTwo),
            ),
            Text(
              'Save More',
              style: AppTextStyles.mediumText
                  .copyWith(color: AppColors.greelightTwo),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 16.0,
                bottom: 4.0,
              ),
              child: PrimaryButton(
                onPressed: () {},
                text: 'Get Started',
              ),
            ),
            const SizedBox(height: 16.0),
            MultiTextButton(
              onPressed: () => log('tap'),
              children: [
                Text(
                  'Alredy have account? ',
                  style:
                      AppTextStyles.smallText.copyWith(color: AppColors.gray),
                ),
                Text(
                  'Log in',
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.greelightTwo),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
