import 'dart:developer';

import 'package:financy_app/common/constats/app_colors.dart';
import 'package:financy_app/common/constats/app_text_styles.dart';
import 'package:financy_app/common/widgets/multi_text_button_widget.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Spend Smarter',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText
                .copyWith(color: AppColors.greelightTwo),
          ),
          Text(
            'Save More',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText
                .copyWith(color: AppColors.greelightTwo),
          ),
          Expanded(
            child: Image.asset('assets/images/sign_up_image.png'),
          ),
          TextFormField(),
          const TextField(),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              top: 16.0,
              bottom: 4.0,
            ),
            child: PrimaryButton(
              onPressed: () => log('teste'),
              text: 'Sing Up',
            ),
          ),
          const SizedBox(height: 16.0),
          MultiTextButton(
            onPressed: () => log('tap'),
            children: [
              Text(
                'Alredy Have Account? ',
                style: AppTextStyles.smallText.copyWith(color: AppColors.gray),
              ),
              Text(
                'Sing in',
                style: AppTextStyles.smallText
                    .copyWith(color: AppColors.greelightTwo),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
