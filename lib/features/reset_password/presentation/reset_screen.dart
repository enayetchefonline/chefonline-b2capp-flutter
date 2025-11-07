
import 'package:chefonline/core/common/common_button.dart';
import 'package:chefonline/core/common/lebel_with_text_field.dart';
import 'package:chefonline/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password',style: Theme.of(context).textTheme.bodyMedium,),),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                hintText: 'Password',
                labelText: 'Password',
                isRequired: true,
                obscureText: true,
                onVisibilityToggle: (){},
              ),
              const SizedBox(height: 8),
              CustomButton(
                label: 'Reset Password',
                leftWidget: Icon(Icons.key,color: AppColors.white,),
                onPressed: (){},
              ),
              // SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
