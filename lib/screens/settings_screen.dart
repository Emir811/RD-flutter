import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        backgroundColor: Colors.purple, // Purple AppBar background
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Theme Option
          ListTile(
            leading: const Icon(Icons.palette, color: Colors.purple), // Purple icon
            title: const Text(
              'Tema',
              style: TextStyle(color: Colors.purple), // Purple text
            ),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme();
              },
              activeColor: Colors.purple, // Purple switch color
            ),
          ),
          const Divider(color: Colors.purple), // Purple divider

          // Notifications Option
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.purple), // Purple icon
            title: const Text(
              'Bildirimler',
              style: TextStyle(color: Colors.purple), // Purple text
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.purple, // Purple switch color
            ),
          ),
          const Divider(color: Colors.purple), // Purple divider

          // Language Option
          ListTile(
            leading: const Icon(Icons.language, color: Colors.purple), // Purple icon
            title: const Text(
              'Dil',
              style: TextStyle(color: Colors.purple), // Purple text
            ),
            trailing: DropdownButton<String>(
              value: 'TR',
              items: ['TR', 'EN'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.purple)), // Purple text
                );
              }).toList(),
              onChanged: (String? newValue) {},
              dropdownColor: Colors.white, // White background for dropdown
              iconEnabledColor: Colors.purple, // Purple icon
            ),
          ),
          const Divider(color: Colors.purple), // Purple divider

          // About App Option
          ListTile(
            leading: const Icon(Icons.info, color: Colors.purple), // Purple icon
            title: const Text(
              'Uygulama Hakkında',
              style: TextStyle(color: Colors.purple), // Purple text
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple), // Purple icon
            onTap: () {},
          ),
          const Divider(color: Colors.purple), // Purple divider

          // Privacy Policy Option
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.purple), // Purple icon
            title: const Text(
              'Gizlilik Politikası',
              style: TextStyle(color: Colors.purple), // Purple text
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple), // Purple icon
            onTap: () {},
          ),
          const Divider(color: Colors.purple), // Purple divider

          // Delete Account Option
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red), // Red icon
            title: const Text(
              'Hesabı Sil',
              style: TextStyle(color: Colors.red), // Red text
            ),
            onTap: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white, // White background for the body
    );
  }
}
