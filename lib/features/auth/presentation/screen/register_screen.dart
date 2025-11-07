import 'package:chefonline/core/common/common_button.dart';
import 'package:chefonline/core/common/custom_textfield.dart';
import 'package:chefonline/core/common/lebel_with_text_field.dart';
import 'package:chefonline/core/config/theme_provider.dart';
import 'package:chefonline/core/constants/app_color.dart';
import 'package:chefonline/features/auth/presentation/screen/widget/PreferenceCard.dart';
import 'package:chefonline/features/auth/presentation/screen/widget/TermsAgreementTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
TextEditingController controller=TextEditingController();
   bool _isFormFilled = false;
   bool agreeTerms = true;
   String? emailPref = 'Yes';
   String? smsPref = 'Yes';
   void _onSubmit() {
     // if (_formKey.currentState!.validate()) {
     //   // ✅ Perform your login or action
     //   print("Form submitted successfully!");
     // }
   }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: Theme.of(context).textTheme.bodyMedium),
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(children: [
              Expanded(child:  LabelWithTextField(
                prefixIcon: Icons.person,
                controller:controller,
                inputType: TextInputType.text,
                hintText: 'Fist name',
                labelText: 'First name',
                isRequired: true,
              ),),
              const SizedBox(width: 8),
              Expanded(child:  LabelWithTextField(
                prefixIcon: Icons.person,
                controller:controller,
                inputType: TextInputType.text,
                hintText: 'Last name',
                labelText: 'Last name',
                isRequired: true,
              ),)
            ],),
            const SizedBox(height: 8),
            LabelWithTextField(
              prefixIcon: Icons.email,
              controller:controller,
              inputType: TextInputType.emailAddress,
              hintText: 'Email',
              labelText: 'Email',
              isRequired: true,
            ),
            const SizedBox(height: 8),
            LabelWithTextField(
              prefixIcon: Icons.phone,
              controller:controller,
              inputType: TextInputType.phone,
              hintText: '07xxxxxxxxx',
              labelText: 'Phone Number',
              isRequired: true,
            ),
            const SizedBox(height: 8),
            LabelWithTextField(
              prefixIcon: Icons.password,
              controller:controller,
              inputType: TextInputType.visiblePassword,
              hintText: 'Password',
              labelText: 'Password',
              isRequired: true,
              obscureText: true,
              onVisibilityToggle: (){},
            ),
            const SizedBox(height: 8),
            LabelWithTextField(
              prefixIcon: Icons.password,
              controller:controller,
              inputType: TextInputType.visiblePassword,
              hintText: 'Confirm Password',
              labelText: 'Confirm Password',
              isRequired: true,
              obscureText: true,
              onVisibilityToggle: (){},
            ),
            const SizedBox(height: 8),
            TermsAgreementTile(
              value: agreeTerms,
              onChanged: (val) {
               // setState(() => agreeTerms = val ?? false);
              },
              onTermsTap: () => print("Terms tapped"),
              onPrivacyTap: () => print("Privacy tapped"),
              onCookiesTap: () => print("Cookies tapped"),
            ),
            const SizedBox(height: 8),
            PreferenceCard(
              title: "I wish to receive emails/newsletters on offers, discounts, promotions and prize draw.",
              groupValue: emailPref,
              onChanged: (val)  {},
              borderColor: AppColors.boarder,
              activeColor: AppColors.primary,
            ),
            const SizedBox(height: 8),
            PreferenceCard(
              title: "I wish to receive text messages on offers, discounts, promotions and prize draw.",
              groupValue: smsPref,
              onChanged: (val) {},
              borderColor: AppColors.boarder,
              activeColor: AppColors.primary,
            ),
            const SizedBox(height: 8),
            CustomButton(
              label: 'REGISTER',
              onPressed: null,
            ),
            // SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

}

