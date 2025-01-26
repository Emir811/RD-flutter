import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Fotoğraf yollarını içeren listeyi oluşturuyoruz
  final List<String> productImages = [
    "assets/images/urun1.webp", // İlk fotoğraf
    "assets/images/urun9.webp", // İkinci fotoğraf
    "assets/images/urun10.webp", // Üçüncü fotoğraf (örnek olarak aynı fotoğrafı ekledim)
    "assets/images/urun8.jpg", // Dördüncü fotoğraf (örnek olarak aynı fotoğrafı ekledim)
  ];

  // Ürün adlarını içeren listeyi oluşturuyoruz
  final List<String> productNames = [
    "Oyuncak Araba", // İlk ürün ismi
    "ps5 dualsens", // İkinci ürün ismi
    "oyuncak ev", // Üçüncü ürün ismi (örnek)
    "eyfel lego", // Dördüncü ürün ismi (örnek)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geçmişte baktıklarınız'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Text('Sıralama:',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.purple)), // Mor renk
                    SizedBox(width: 8),
                    ChoiceChip(
                      label: Text('En Yeni'),
                      selected: true,
                      onSelected: (_) {},
                      selectedColor: Colors.purple,
                      backgroundColor: Colors.grey[200], // Arka plan rengi
                    ),
                    SizedBox(width: 8),
                    ChoiceChip(
                      label: Text('Fiyat'),
                      selected: false,
                      onSelected: (_) {},
                      selectedColor: Colors.purple,
                      backgroundColor: Colors.grey[200], // Arka plan rengi
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Burayı 2'den 4'e çıkardık
                childAspectRatio: 0.75, // Gerekirse bu değeri de ayarlayabilirsiniz
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: productImages.length, // Fotoğraf sayısını liste uzunluğuna göre ayarlıyoruz
              itemBuilder: (context, index) => Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            child: Image.asset(
                              productImages[index], // Fotoğrafı dinamik olarak alıyoruz
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productNames[index], // Ürün ismini dinamik olarak alıyoruz
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.purple), // Mor renk
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '₺${(index + 1) * 2000}', // Fiyatı dinamik olarak ayarlıyoruz
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.purple), // Mor renk
                          ),
                          SizedBox(height: 8),
                          FilledButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart, size: 18),
                            label: Text('Sepete Ekle'),
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.purple, // Mor renk
                              minimumSize: Size(double.infinity, 36),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Filtreleme'),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fiyat',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.purple), // Mor renk
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Min.',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple), // Mor renk
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Max.',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple), // Mor renk
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Kategoriler',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.purple), // Mor renk
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text('Elektronik'),
                  selected: false,
                  onSelected: (_) {},
                  selectedColor: Colors.purple,
                ),
                FilterChip(
                  label: Text('ev'),
                  selected: false,
                  onSelected: (_) {},
                  selectedColor: Colors.purple,
                ),
                FilterChip(
                  label: Text('aksesuar'),
                  selected: false,
                  onSelected: (_) {} ,
                  selectedColor: Colors.purple,
                ),
                FilterChip(
                  label: Text('dekor'),
                  selected: false,
                  onSelected: (_) {},
                  selectedColor: Colors.purple,
                ),
                FilterChip(
                  label: Text('araba'),
                  selected: false,
                  onSelected: (_) {},
                  selectedColor: Colors.purple,
                ),
                FilterChip(
                  label: Text('tekstil'),
                  selected: false,
                  onSelected: (_) {},
                  selectedColor: Colors.purple,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Arama',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.purple), // Mor renk
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'istediğiniz ürünü giriniz...',
                prefixIcon: Icon(Icons.search, color: Colors.purple), // Mor renk
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('sil', style: TextStyle(color: Colors.purple)), // Mor renk
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: Text('onayla'),
            style: FilledButton.styleFrom(backgroundColor: Colors.purple), // Mor renk
          ),
        ],
      ),
    );
  }
}
