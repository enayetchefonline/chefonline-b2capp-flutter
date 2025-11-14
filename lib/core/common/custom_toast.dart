import 'package:chefonline/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showSuccessToast(BuildContext context,String message,{AlignmentGeometry alignment=Alignment.center}) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    alignment: alignment,
    title: Text('Success'),
    description: Text(message,style:TextStyle(fontWeight: FontWeight.w500,color: AppColors.white),),
    autoCloseDuration: const Duration(seconds: 3),
  );
}

void showInfoToast(BuildContext context,String message,{AlignmentGeometry alignment=Alignment.center}) {
  toastification.show(
    context: context,
    type: ToastificationType.info,
    style: ToastificationStyle.fillColored,
    alignment: alignment,
    title: Text('Info'),
    description: Text(message,style:TextStyle(fontWeight: FontWeight.w500,color: AppColors.white),),
    autoCloseDuration: const Duration(seconds: 3),
  );
}

void showWarningToast(BuildContext context, String message,{AlignmentGeometry alignment=Alignment.center}) {
  toastification.show(
    context: context,
    type: ToastificationType.warning,
    style: ToastificationStyle.fillColored,
    alignment: alignment,
    title: Text('Warning'),
    description: Text(message,style:TextStyle(fontWeight: FontWeight.w500,color: AppColors.white),),
    autoCloseDuration: const Duration(seconds: 3),
  );
}

void showErrorToast(BuildContext context, String message,{AlignmentGeometry alignment=Alignment.center}) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    alignment: alignment,
    title: Text('Error'),
    description: Text(message,style:TextStyle(fontWeight: FontWeight.w500,color: AppColors.white),),
    autoCloseDuration: const Duration(seconds: 3),
  );
}