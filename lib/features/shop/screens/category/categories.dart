import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedix/common/widget/products/products_cards/product_card_vertical.dart';


class SubCategoriesScreen extends StatelessWidget {
  final String categoryId; // Kategorinin ID'si
  final String categoryName; // Kategorinin adı

  const SubCategoriesScreen({
    super.key,
    required this.categoryId, // Kategori ID'si
    required this.categoryName, // Kategori adı
  });

  // Kategoriye ait ürünleri Firestore'dan almak için bir fonksiyon
  Future<List<QueryDocumentSnapshot>> _getProductsByCategory() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products') // Ürünler koleksiyonu
          .where('categoryId', isEqualTo: categoryId) // Kategoriye ait ürünleri getiriyoruz
          .get();
      return querySnapshot.docs;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName), // Kategori ismi burada gösteriliyor
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              FutureBuilder<List<QueryDocumentSnapshot>>(
                future: _getProductsByCategory(), // Kategoriye ait ürünleri alıyoruz
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products available.'));
                  }

                  List<QueryDocumentSnapshot> products = snapshot.data!;
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Grid düzeni (2 sütun)
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      // Fiyatı String'den double'a çeviriyoruz
                      double price = double.tryParse(product['price'].toString()) ?? 0.0;
                      return TProductCardVertical(
                        title: product['title'], // Ürün başlığı
                        price: price, // Ürün fiyatı
                        imageUrl: product['imageUrl'], // Ürün resmi
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}