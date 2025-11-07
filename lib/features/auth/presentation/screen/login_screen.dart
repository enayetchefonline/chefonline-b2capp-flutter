

import 'package:chefonline/core/common/common_button.dart';
import 'package:chefonline/core/common/custom_textfield.dart';
import 'package:chefonline/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Login',style: Theme.of(context).textTheme.bodyMedium,),),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
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
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Email Field
                CustomTextField(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),

                // Password Field
                CustomTextField(
                  prefixIcon: Icons.password,
                  controller:_passwordController,
                  inputType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  obscureText: true,
                  onVisibilityToggle: (){},
                ),
                const SizedBox(height: 10),

                // Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                     Text(
                      'Remember Me',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                CustomButton(
                  textColor: Colors.white,
                  label: 'Sign In',
                  onPressed: (){},
                ),
                const SizedBox(height: 15),

                // Google Button
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dangerLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Google login
                    },
                    icon: const Icon(Icons.g_mobiledata, size: 28,color: AppColors.white,),
                    label:  Text(
                      'Continue with Google',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Facebook Button
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1877F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {

                    },
                    icon: const Icon(Icons.facebook, size: 24,color: AppColors.white,),
                    label:  Text(
                      'Continue with Facebook',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Forgot Password
                TextButton(
                  onPressed: () {
                    // TODO: Forgot password action
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        context.go('/profile/register');
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}