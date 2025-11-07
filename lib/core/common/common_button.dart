import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget? leftWidget;  // 👈 Optional widget on the left
  final Widget? rightWidget; // 👈 Optional widget on the right
  final double? width;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.height = 42,
    this.borderRadius = 5,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.leftWidget,
    this.rightWidget,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 2,
        ),
        child: isLoading
            ? SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(
              textColor ?? theme.colorScheme.onPrimary,
            ),
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leftWidget != null) ...[
              leftWidget!,
              const SizedBox(width: 7),
            ],
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor ?? theme.colorScheme.onPrimary,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            if (rightWidget != null) ...[
              const SizedBox(width: 7),
              rightWidget!,
            ],
          ],
        ),
      ),
    );
  }
}