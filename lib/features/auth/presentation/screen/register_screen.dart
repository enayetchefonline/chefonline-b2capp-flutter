import 'dart:io';

import 'package:chefonline/core/common/common_button.dart';
import 'package:chefonline/core/common/custom_textfield.dart';
import 'package:chefonline/core/common/custom_toast.dart';
import 'package:chefonline/core/common/lebel_with_text_field.dart';
import 'package:chefonline/core/config/theme_provider.dart';
import 'package:chefonline/core/constants/app_color.dart';
import 'package:chefonline/core/utils/text_input_format.dart';
import 'package:chefonline/features/auth/presentation/provider/auth_provider.dart';
import 'package:chefonline/features/auth/presentation/screen/widget/PreferenceCard.dart';
import 'package:chefonline/features/auth/presentation/screen/widget/TermsAgreementTile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameCtlr = TextEditingController();

  TextEditingController lastNameCtlr = TextEditingController();

  TextEditingController emailCtlr = TextEditingController();

  TextEditingController phoneCtlr = TextEditingController();

  TextEditingController passwordCtlr = TextEditingController();

  TextEditingController confirmPasswordCtlr = TextEditingController();

  bool _visiblePassword = false;
  bool _inVisibleConfirmPassword = false;

  bool agreeTerms = false;

  String? emailPref = 'Yes';

  String? smsPref = 'Yes';

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    firstNameCtlr.addListener(_submitForm);
    lastNameCtlr.addListener(_submitForm);
    emailCtlr.addListener(_submitForm);
    phoneCtlr.addListener(_submitForm);
    passwordCtlr.addListener(_submitForm);
    confirmPasswordCtlr.addListener(_submitForm);
  }

  @override
  void dispose() {
    firstNameCtlr.dispose();
    lastNameCtlr.dispose();
    emailCtlr.dispose();
    phoneCtlr.dispose();
    passwordCtlr.dispose();
    confirmPasswordCtlr.dispose();
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      final formValid = _formKey.currentState?.validate() ?? false;
      final termsValid = agreeTerms;
      isButtonEnabled = formValid && termsValid;
    });
  }

  String? _validateEmail(String? value) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    final phoneRegExp = RegExp(r'^(?:\+44|0)7\d{9}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid UK phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$',
    ); // 8 chars min, 1 letter + 1 number
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!passwordRegExp.hasMatch(value)) {
      return 'Password must be at least 8 characters, include letters & numbers';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordCtlr.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: Theme.of(context).textTheme.bodyMedium),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onChanged: _submitForm,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: LabelWithTextField(
                        prefixIcon: Icons.person,
                        controller: firstNameCtlr,
                        inputType: TextInputType.text,
                        hintText: 'Fist name',
                        labelText: 'First name',
                        isRequired: true,
                        inputFormatters: [CapitalizeFirstLetterFormatter()],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LabelWithTextField(
                        prefixIcon: Icons.person,
                        controller: lastNameCtlr,
                        inputType: TextInputType.text,
                        hintText: 'Last name',
                        labelText: 'Last name',
                        isRequired: true,
                        inputFormatters: [CapitalizeFirstLetterFormatter()],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LabelWithTextField(
                  prefixIcon: Icons.email,
                  controller: emailCtlr,
                  inputType: TextInputType.emailAddress,
                  hintText: 'Email',
                  labelText: 'Email',
                  isRequired: true,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 8),
                LabelWithTextField(
                  prefixIcon: Icons.phone,
                  controller: phoneCtlr,
                  inputType: TextInputType.phone,
                  hintText: '07xxxxxxxxx',
                  labelText: 'Phone Number',
                  isRequired: true,
                  validator: _validatePhone,
                ),
                const SizedBox(height: 8),
                LabelWithTextField(
                  prefixIcon: Icons.password,
                  controller: passwordCtlr,
                  inputType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  labelText: 'Password',
                  isRequired: true,
                  obscureText:  !_visiblePassword,
                  onVisibilityToggle: () {
                    setState(() => _visiblePassword = !_visiblePassword);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                LabelWithTextField(
                  prefixIcon: Icons.password,
                  controller: confirmPasswordCtlr,
                  inputType: TextInputType.visiblePassword,
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  isRequired: true,
                  obscureText: _inVisibleConfirmPassword,
                  onVisibilityToggle: () {
                    setState(() => _inVisibleConfirmPassword = !_inVisibleConfirmPassword);
                  },
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: 8),
                TermsAgreementTile(
                  value: agreeTerms,
                  onChanged: (val) {
                    setState(() => agreeTerms = val ?? false);
                    _submitForm();
                  },
                  onTermsTap: () => print("Terms tapped"),
                  onPrivacyTap: () => print("Privacy tapped"),
                  onCookiesTap: () => print("Cookies tapped"),
                ),
                const SizedBox(height: 8),
                PreferenceCard(
                  title:
                      "I wish to receive emails/newsletters on offers, discounts, promotions and prize draw.",
                  groupValue: emailPref,
                  onChanged: (val) {
                    setState(() => emailPref = val);
                  },
                  borderColor: AppColors.boarder,
                  activeColor: AppColors.primary,
                ),
                const SizedBox(height: 8),
                PreferenceCard(
                  title:
                      "I wish to receive text messages on offers, discounts, promotions and prize draw.",
                  groupValue: smsPref,
                  onChanged: (val) {
                    setState(() => smsPref = val);
                  },
                  borderColor: AppColors.boarder,
                  activeColor: AppColors.primary,
                ),
                const SizedBox(height: 8),
                CustomButton(
                  label: 'REGISTER',
                  isLoading: authProvider.isLoadingRegister,
                  onPressed: isButtonEnabled
                      ? () async {
                          final Response response = await authProvider
                              .userRegister(context, {
                                "funId": 8,
                                "fname": firstNameCtlr.text.trim(),
                                "lname": lastNameCtlr.text.trim(),
                                "email": emailCtlr.text.trim(),
                                "mobile_no": phoneCtlr.text.trim(),
                                "password": passwordCtlr.text.trim(),
                                "want_newslatter": emailPref == 'Yes' ? 1 : 0,
                                "platform": Platform.isAndroid ? 1 : 2,
                                "want_text_message": emailPref == 'Yes' ? 1 : 0,
                              });
                          if (response.data['status'] == 'Success') {
                            if(!context.mounted) return;
                            showSuccessToast(context, response.data['msg']);
                          } else if (response.data['status'] == 'Failed') {
                            if(!context.mounted) return;
                            showErrorToast(context, response.data['msg']);
                          }
                        }
                      : null,
                ),
                // SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
