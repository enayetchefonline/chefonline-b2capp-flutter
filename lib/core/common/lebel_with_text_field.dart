

import 'package:chefonline/core/common/custom_textfield.dart';
import 'package:flutter/material.dart';

class LabelWithTextField extends StatelessWidget {

  final TextEditingController controller;
  final IconData prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final bool isRequired;
  final int maxLength;
  final int maxLines;
  final VoidCallback? onVisibilityToggle;

  const LabelWithTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
    required this.hintText,
    required this.labelText,
    this.validator,
    this.isRequired=false,
    this.maxLines=1,
    this.maxLength=32,
    this.onVisibilityToggle
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Row(
           children: [
             Text(labelText,style: Theme.of(context).textTheme.bodyMedium,),
             SizedBox(width: 5,),
             Text(isRequired?'*':'',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
           ],
         ),
         CustomTextField(
           prefixIcon: prefixIcon,
           controller:controller,
           inputType: inputType,
           hintText: hintText,
           obscureText: obscureText,
           textCapitalization: textCapitalization,
           validator: validator,
           maxLength: maxLength,
           maxLines: maxLines,
           onVisibilityToggle: onVisibilityToggle,
         ),
       ],
    );
  }
}
