
import 'package:chefonline/core/config/theme_provider.dart';
import 'package:chefonline/core/constants/app_color.dart';
import 'package:chefonline/features/settings/presentation/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryRed = Color(0xFFD32F2F);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Settings',style: Theme.of(context).textTheme.bodyMedium,),backgroundColor: Theme.of(context).scaffoldBackgroundColor,),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: primaryRed,
              ),
              title:  Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: Switch(
                activeColor: primaryRed,
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  SettingsCard(
                    icon: Icons.info,
                    title: 'ABOUT US',
                    color: primaryRed,
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  SettingsCard(
                    icon: Icons.cookie,
                    title: 'COOKIES POLICY',
                    color: primaryRed,
                    onTap: () {
                      Navigator.pushNamed(context, '/cookies');
                    },
                  ),
                  SettingsCard(
                    icon: Icons.description,
                    title: 'TERMS & CONDITIONS',
                    color: primaryRed,
                    onTap: () {
                      Navigator.pushNamed(context, '/terms');
                    },
                  ),
                  SettingsCard(
                    icon: Icons.privacy_tip,
                    title: 'PRIVACY POLICY',
                    color: primaryRed,
                    onTap: () {
                      Navigator.pushNamed(context, '/privacy');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}