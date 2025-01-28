import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıt Ol'),
        backgroundColor: Colors.purple, // Purple AppBar
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Name TextField
              TextField(
                decoration: InputDecoration(
                  hintText: "Ad Soyad",
                  hintStyle: const TextStyle(color: Colors.purple), // Purple hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.purple), // Purple border
                  ),
                  prefixIcon: const Icon(Icons.person, color: Colors.purple), // Purple icon
                ),
              ),
              const SizedBox(height: 16),

              // Email TextField
              TextField(
                decoration: InputDecoration(
                  hintText: "E-Posta",
                  hintStyle: const TextStyle(color: Colors.purple), // Purple hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.purple), // Purple border
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.purple), // Purple icon
                ),
              ),
              const SizedBox(height: 16),

              // Password TextField
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Şifre",
                  hintStyle: const TextStyle(color: Colors.purple), // Purple hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.purple), // Purple border
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.purple), // Purple icon
                ),
              ),
              const SizedBox(height: 16),

              // Confirm Password TextField
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Şifre Tekrar",
                  hintStyle: const TextStyle(color: Colors.purple), // Purple hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.purple), // Purple border
                  ),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.purple), // Purple icon
                ),
              ),
              const SizedBox(height: 24),

              // Register Button
              FilledButton(
                onPressed: () {
                  context.go("/home");
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.purple, // Purple background
                  foregroundColor: Colors.white, // White text
                ),
                child: const Text("Kayıt Ol", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 12),

              // Login Button
              OutlinedButton(
                onPressed: () {
                  context.push("/login");
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: Colors.purple), // Purple border
                ),
                child: const Text("Giriş Yap", style: TextStyle(fontSize: 16, color: Colors.purple)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
