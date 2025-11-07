import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAgreementTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onCookiesTap;

  const TermsAgreementTile({
    super.key,
    required this.value,
    required this.onChanged,
    this.onTermsTap,
    this.onPrivacyTap,
    this.onCookiesTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.4),
              children: [
                 TextSpan(text: "I Agree to the ",style:Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                  text: "Terms & Conditions, ",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                ),
                TextSpan(
                  text: "Privacy Policy ",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
                ),
                const TextSpan(text: "& "),
                TextSpan(
                  text: "Cookies Policy",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onCookiesTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
