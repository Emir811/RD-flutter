import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../core/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 150, //
                height: 150,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            InkWell(
              onTap: () => context.go("/home"),
              child: SizedBox(
                width: 300,
                child: DotLottieLoader.fromAsset(
                  "assets/motions/loading.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(255, 192, 28, 233), 
                  width: 2,
                ),
              ),
              child: Text(
                "Yükleniyor...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 192, 28, 233), 
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
