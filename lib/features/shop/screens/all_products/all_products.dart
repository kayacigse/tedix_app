import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/products/products_cards/product_card_vertical.dart';
import 'package:tedix/layouts/grid_layout.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  // Firestore'dan tüm ürünleri almak için bir fonksiyon
  Future<List<QueryDocumentSnapshot>> _getAllProducts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products') // Firestore koleksiyonu ismi
          .get(); // Tüm ürünleri alıyoruz
      return querySnapshot.docs;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Products', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              // Firestore'dan tüm ürünleri alıp GridLayout'ta gösteriyoruz
              FutureBuilder<List<QueryDocumentSnapshot>>(
                future: _getAllProducts(), // Verileri alıyoruz
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

                  // Veriler geldiyse, GridLayout'ı gösteriyoruz
                  List<QueryDocumentSnapshot> products = snapshot.data!;
                  return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      return TProductCardVertical(
                        title: product['title'], // Firestore'dan gelen veri
                        // price'ı String'den double'a dönüştürüyoruz
                        price: (product['price'] is String)
                            ? double.tryParse(product['price']) ?? 0.0
                            : product['price'].toDouble(), // Firestore'dan gelen veri
                        imageUrl: product['imageUrl'], // Firestore'dan gelen veri
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