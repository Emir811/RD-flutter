import 'package:flutter/material.dart';
import '../core/constants.dart';  
import '../core/themes.dart';     
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Filtreler"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Fiyat Aralığı"),
                RangeSlider(
                  min: 0.0,
                  max: 10000.0,
                  divisions: 100,
                  values: const RangeValues(100, 5000),
                  onChanged: (RangeValues values) {
                  },
                ),
                const SizedBox(height: 10),
                
                const Text("Durum"),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: const Text("Yeni"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: const Text("İkinci El"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Vazgeç"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Uygula"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'title': 'Emlak', 'icon': Icons.home, 'color': const Color.fromARGB(255, 174, 98, 187)},
      {'title': 'Vasıta', 'icon': Icons.directions_car, 'color': const Color.fromARGB(255, 100, 53, 182)},
      {'title': 'Yedek Parça', 'icon': Icons.build, 'color': const Color.fromARGB(255, 118, 28, 156)},
      {'title': 'İkinci El', 'icon': Icons.shopping_bag, 'color': const Color.fromARGB(255, 166, 67, 184)},
      {'title': 'İş Makineleri', 'icon': Icons.agriculture, 'color': const Color.fromARGB(255, 162, 50, 182)},
      {'title': 'Hizmetler', 'icon': Icons.handyman, 'color': const Color.fromARGB(255, 134, 36, 161)},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ara", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple, 
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: TextField(
              decoration: InputDecoration(
                hintText: "Kelime veya ilan no. ile ara",
                hintStyle: const TextStyle(color: Color.fromARGB(179, 32, 32, 32)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune, color: Colors.purple),
                  onPressed: () {
                    _showFilterDialog(context);
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kategoriler",
                    style: TextStyle(
                      color: Colors.purple, 
                      fontSize: 22, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(categories[index]['title'] as String),
                              content: const Text("Kategoriye tıkladınız!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Tamam"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 8, 
                          margin: const EdgeInsets.only(bottom: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: categories[index]['color'] as Color,
                                  child: Icon(
                                    categories[index]['icon'] as IconData,
                                    color: Colors.white,
                                  ),
                                  radius: 30,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    categories[index]['title'] as String,
                                    style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),//
    );
  }
}
