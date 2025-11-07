
import 'package:chefonline/core/common/common_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile',style: Theme.of(context).textTheme.bodyMedium,),),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
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
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.person_outline_rounded, color: Colors.white, size: 50),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Test vaduri',
                ),
                const SizedBox(height: 6),
                const Text('test.engineer1@gmail.com'),
                const Text('07121451215'),
                const Text('CM17 9AA'),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        leftWidget: Icon(Icons.edit,color: Colors.white,),
                        label: 'EDIT PROFILE',
                        textColor: Colors.white,
                        fontSize: 14,
                        onPressed: (){
                          context.push('/profile/edit_screen');
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: CustomButton(
                        leftWidget: Icon(Icons.key,color: Colors.white,),
                        label: 'RESET PASSWORD',
                        textColor: Colors.white,
                        fontSize: 14,
                        onPressed: (){
                          context.push('/profile/reset_password');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        leftWidget: Icon(Icons.list_alt,color: Colors.white,),
                        label: 'ORDER HISTORY',
                        textColor: Colors.white,
                        fontSize: 14,
                        onPressed: (){
                          context.push('/profile/order_history');
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: CustomButton(
                        leftWidget: Icon(Icons.logout,color: Colors.white,),
                        label: 'SIGN OUT',
                        textColor: Colors.white,
                        fontSize: 14,
                        onPressed: (){
                          context.push('/profile/login');
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                CustomButton(
                  leftWidget:Icon(Icons.delete, color: Colors.white),
                  backgroundColor: Colors.red.shade900,
                  label: 'DELETE PROFILE',
                  textColor: Colors.white,
                  onPressed: (){
                    context.push('/init_screen');
                  },
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
