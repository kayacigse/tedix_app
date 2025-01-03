import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../common/widget/appbar/appbar.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _productNameController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> _addProduct() async {
    String productName = _productNameController.text.trim();
    String price = _priceController.text.trim();
    String category = _categoryController.text.trim();

    if (productName.isEmpty || price.isEmpty || category.isEmpty) {
      // Validation for empty fields
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }


    try {
      await _firestore.collection('products').add({
        'productName': productName,
        'price': double.tryParse(price) ?? 0.0, // Convert price to double
        'category': category,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _productNameController.clear();
      _priceController.clear();
      _categoryController.clear();


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product added successfully')));
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Add Product")
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 16,),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16,),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}

