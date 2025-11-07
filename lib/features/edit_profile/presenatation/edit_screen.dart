import 'package:chefonline/core/common/common_button.dart';
import 'package:chefonline/core/common/lebel_with_text_field.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Center(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LabelWithTextField(
                    prefixIcon: Icons.person,
                    controller: controller,
                    inputType: TextInputType.text,
                    hintText: 'Title',
                    labelText: 'Title',
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: LabelWithTextField(
                          prefixIcon: Icons.person,
                          controller: controller,
                          inputType: TextInputType.text,
                          hintText: 'Fist name',
                          labelText: 'First name',
                          isRequired: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: LabelWithTextField(
                          prefixIcon: Icons.person,
                          controller: controller,
                          inputType: TextInputType.text,
                          hintText: 'Last name',
                          labelText: 'Last name',
                          isRequired: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LabelWithTextField(
                    prefixIcon: Icons.email,
                    controller: controller,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Email',
                    labelText: 'Email',
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: LabelWithTextField(
                          prefixIcon: Icons.person,
                          controller: controller,
                          inputType: TextInputType.text,
                          hintText: '07xxxxxxxxx',
                          labelText: 'Phone',
                          isRequired: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: LabelWithTextField(
                          prefixIcon: Icons.person,
                          controller: controller,
                          inputType: TextInputType.text,
                          hintText: 'Telephone',
                          labelText: 'Telephone',
                          isRequired: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LabelWithTextField(
                    prefixIcon: Icons.email,
                    controller: controller,
                    inputType: TextInputType.emailAddress,
                    hintText: 'DOB',
                    labelText: 'Date of Birth (DOB)',
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  LabelWithTextField(
                    prefixIcon: Icons.email,
                    controller: controller,
                    inputType: TextInputType.emailAddress,
                    hintText: 'DOA',
                    labelText: 'Anniversary Date (DOA)',
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  LabelWithTextField(
                    prefixIcon: Icons.email,
                    controller: controller,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Address Line 1',
                    labelText: 'Address Line 1',
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  LabelWithTextField(
                    prefixIcon: Icons.email,
                    controller: controller,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Address Line 2',
                    labelText: 'Address Line 2',
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  LabelWithTextField(
                    prefixIcon: Icons.email,
                    controller: controller,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Address Line 3',
                    labelText: 'Address Line 3',
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: LabelWithTextField(
                          prefixIcon: Icons.person,
                          controller: controller,
                          inputType: TextInputType.text,
                          hintText: 'Postcode',
                          labelText: 'Postcode',
                          isRequired: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: LabelWithTextField(
                          prefixIcon: Icons.person,
                          controller: controller,
                          inputType: TextInputType.text,
                          hintText: 'Town',
                          labelText: 'Town',
                          isRequired: true,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: LabelWithTextField(
                          prefixIcon: Icons.person,
                          controller: controller,
                          inputType: TextInputType.text,
                          hintText: 'Country',
                          labelText: 'Country',
                          isRequired: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  CustomButton(label: 'SAVE CHANGES', onPressed: () {}),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
