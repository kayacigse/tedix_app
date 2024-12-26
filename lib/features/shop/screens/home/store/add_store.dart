import 'package:flutter/material.dart';

import '../../../../../common/widget/appbar/appbar.dart';

class AddStoreScreen extends StatelessWidget {
  const AddStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Add Product',style: Theme.of(context).textTheme.headlineMedium),
      ),

    );
  }
}

// Ürün ekleme sayfası
class ProductAddPage extends StatelessWidget {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Ürün Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              controller: productNameController,
              label: 'Product Name',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: priceController,
              label: 'Price',
              inputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: descriptionController,
              label: 'Product Description',
              maxLines: 3,
            ),
            SizedBox(height: 16),
            _buildCategoryDropdown(),
            SizedBox(height: 16),
            _buildSubmitButton(
              onPressed: () {
                print('Ürün adı: ${productNameController.text}');
                print('Fiyat: ${priceController.text}');
                print('Açıklama: ${descriptionController.text}');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Genel metin alanı bileşeni
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Kategori seçim dropdown bileşeni
  Widget _buildCategoryDropdown() {
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(
          value: 'car',
          child: Text('Car'),
        ),
        DropdownMenuItem(
          value: 'phone',
          child: Text('Phone'),
        ),
        DropdownMenuItem(
          value: 'laptop',
          child: Text('Laptop'),
        ),
      ],
      onChanged: (value) {
        print('Seçilen kategori: $value');
      },
      decoration: InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(),
      ),
    );
  }

  // Gönderim düğmesi bileşeni
  Widget _buildSubmitButton({required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Ürünü Ekle'),
    );
  }
}