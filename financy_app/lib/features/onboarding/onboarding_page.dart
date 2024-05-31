import 'package:financy_app/common/constats/app_colors.dart';
import 'package:financy_app/common/constats/app_text_styles.dart';
import 'package:flutter/material.dart';


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
              flex: 2,
              child: Container(
                color: AppColors.iceWhite,
                child: Image.asset('assets/images/man.png'),
              ),
            ),
            Text('Spend Smarter', 
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greelightTwo
              ),
            ),
            Text('Save More',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greelightTwo
              ),
            ),
            ElevatedButton(
              onPressed: () {}, 
            child: 
            Text(
              'Get Started',
              ),
            ),
            Text('Alredy have account? Log in',
            style: AppTextStyles.smallText.copyWith(
              color: AppColors.gray
              ),
            ),
            SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}