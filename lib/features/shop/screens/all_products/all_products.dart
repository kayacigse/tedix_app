import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/products/products_cards/product_card_vertical.dart';
import 'package:tedix/layouts/grid_layout.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({super.key});


  Future<List<QueryDocumentSnapshot>> _getAllProducts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
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
      appBar: TAppBar(
        title: Text('Products', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [

              FutureBuilder<List<QueryDocumentSnapshot>>(
                future: _getAllProducts(),
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
                  return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      return TProductCardVertical(
                        title: product['title'],

                        price: (product['price'] is String)
                            ? double.tryParse(product['price']) ?? 0.0
                            : product['price'].toDouble(),
                        imageUrl: product['imageUrl'],
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