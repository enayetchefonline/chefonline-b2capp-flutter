

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
    color: AppColors.bodyText,
    height: 1.3,
  );

  // Headline medium
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.bodyText,
    height: 1.3,
  );

  // Body text
  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.bodyText,
    height: 1.5,
  );
  static const TextStyle bodyBold = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.bodyText,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.caption,
    height: 1.4,
  );

  static final TextStyle button = body.copyWith(
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: AppColors.onPrimary,
  );
}