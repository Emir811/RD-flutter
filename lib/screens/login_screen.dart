import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController epostaYonetici = TextEditingController();
  TextEditingController sifreYonetici = TextEditingController();

  girisYap() {
    if (epostaYonetici.text.isEmpty || sifreYonetici.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Yanlış e-posta veya şifre"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          showCloseIcon: true,
        ),
      );
    } else {
      if (sifreYonetici.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Şifre minimum 6 haneli olabilir."),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            showCloseIcon: true,
          ),
        );
      } else {
        context.go("/home");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple, 
        title: const Text("Giriş Yap", style: TextStyle(fontSize: 18)),
        centerTitle: true,
        elevation: 0, 
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),

              
              TextField(
                controller: epostaYonetici,
                decoration: InputDecoration(
                  hintText: "E-Posta",
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.purple.shade700,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),

              
              TextFormField(
                obscureText: true,
                controller: sifreYonetici,
                decoration: InputDecoration(
                  hintText: "Şifre",
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.purple.shade700,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 24),

              
              ElevatedButton(
                onPressed: girisYap,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.purple, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Giriş Yap", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 12),

              
              ElevatedButton(
                onPressed: () {
                  context.pushReplacement("/register");
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.purple, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Kayıt Ol", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 24),

              
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Image.asset('assets/icons/google_icon.png', height: 24),
                label: const Text("Google ile Giriş Yap",
                    style: TextStyle(fontSize: 16, color: Colors.purple)),
              ),
              const SizedBox(height: 12),

              
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Image.asset('assets/icons/apple_icon.png', height: 24),
                label: const Text("Apple ID ile Giriş Yap",
                    style: TextStyle(fontSize: 16, color: Colors.purple)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 177, 177, 177), 
    );
  }
}
