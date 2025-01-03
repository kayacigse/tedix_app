import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedix/common/widget/products/products_cards/product_card_vertical.dart';
import 'package:tedix/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tedix/features/shop/screens/home/widgets/home_categories.dart';
import 'package:tedix/layouts/grid_layout.dart';
import '../../../../common/widget/containers/primary_header_container.dart';
import '../../../../common/widget/containers/search_container.dart';
import '../../../../common/widget/texts/section_heading.dart';

import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  Future<List<QueryDocumentSnapshot>> _getProducts() async {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: 32),
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      children: [
                        TSectionHeading(
                            title: 'Categories', showActionButton: false, textColor: Colors.white),
                        const SizedBox(height: 16),
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Products',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllProducts()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),


                  FutureBuilder<List<QueryDocumentSnapshot>>(
                    future: _getProducts(),
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


                          String title = product['title'] ?? 'No Title';
                          double price = product['price'] != null ? product['price'].toDouble() : 0.0;
                          String imageUrl = product['imageUrl'] ?? '';


                          return TProductCardVertical(
                            title: title,
                            price: price,
                            imageUrl: imageUrl,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
