import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tedix/models/products.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Product> getProductById(String productId) async {
    DocumentSnapshot docSnapshot = await _db.collection('products').doc(productId).get();

    if (docSnapshot.exists) {
      return Product.fromMap(docSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('Product not found');
    }
  }
}
