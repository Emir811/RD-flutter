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
        backgroundColor: Colors.purple, 
        elevation: 0,
      ),
      body: ListView(
        children: [
          
          ListTile(
            leading: const Icon(Icons.palette, color: Colors.purple), 
            title: const Text(
              'Tema',
              style: TextStyle(color: Colors.purple), 
            ),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                context.read<ThemeProvider>().toggleTheme();
              },
              activeColor: Colors.purple, 
            ),
          ),
          const Divider(color: Colors.purple), 

          
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.purple), 
            title: const Text(
              'Bildirimler',
              style: TextStyle(color: Colors.purple), 
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.purple, 
            ),
          ),
          const Divider(color: Colors.purple), 

          // Language Option
          ListTile(
            leading: const Icon(Icons.language, color: Colors.purple), 
            title: const Text(
              'Dil',
              style: TextStyle(color: Colors.purple),
            ),
            trailing: DropdownButton<String>(
              value: 'TR',
              items: ['TR', 'EN'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.purple)), 
                );
              }).toList(),
              onChanged: (String? newValue) {},
              dropdownColor: Colors.white, 
              iconEnabledColor: Colors.purple, 
            ),
          ),
          const Divider(color: Colors.purple), 

          
          ListTile(
            leading: const Icon(Icons.info, color: Colors.purple), 
            title: const Text(
              'Uygulama Hakkında',
              style: TextStyle(color: Colors.purple), 
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple),
            onTap: () {},
          ),
          const Divider(color: Colors.purple), 

          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.purple), 
            title: const Text(
              'Gizlilik Politikası',
              style: TextStyle(color: Colors.purple),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.purple), 
            onTap: () {},
          ),
          const Divider(color: Colors.purple), 

          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red), //
            title: const Text(
              'Hesabı Sil',
              style: TextStyle(color: Colors.red), 
            ),
            onTap: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white, 
    );
  }
}
