import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedix/features/shop/screens/category/categories.dart';
import 'package:tedix/common/widget/image_text_widgets/vertical_image_text.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  // Kategorileri Firestore'dan almak için bir fonksiyon
  Future<List<QueryDocumentSnapshot>> _getCategories() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('categories') // Kategoriler koleksiyonu
          .get();
      return querySnapshot.docs;
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: _getCategories(), // Kategorileri alıyoruz
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories available.'));
          }

          List<QueryDocumentSnapshot> categories = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              var category = categories[index];
              return TVerticalImageText(
                image: category['imageUrl'], // Firestore'dan gelen kategori resmi
                title: category['name'], // Kategori adı
                onTap: () {
                  // Kategorinin id'sine göre ürünler ekranına yönlendiriyoruz
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesScreen(
                        categoryId: category.id,
                        categoryName: category['name'],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}