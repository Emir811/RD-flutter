import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/bottom_menu.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Emlak',
      'Vasıta',
      'İkinci El',
      'Yedek Parça',
      'İş İlanı',
      'Hayvan',
    ];

    return Scaffold(
      backgroundColor: Colors.white, 
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar.large(
                floating: true,
                pinned: true,
                backgroundColor: Colors.purple.shade700, 
                title: const Text(
                  "İlan ver",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold, 
                    color: Colors.white, 
                  ),
                ),
                elevation: 8, 
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        "İlan vereceğiniz kategoriyi seçiniz",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade700, 
                            ),
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1,
                        children: List.generate(6, (index) {
                          return GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              elevation: 6, 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16), 
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(16)), 
                                      child: Image.asset(
                                        "assets/images/ressim${index + 1}.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.purple.shade50, 
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.category, 
                                          color: Colors.purple.shade700,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          categories[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  FilledButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Seç',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white), 
                                    ),
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.purple.shade600, 
                                      minimumSize: const Size(double.infinity, 48), 
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 4, 
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),//
    );
  }
}

