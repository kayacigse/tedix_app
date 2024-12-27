import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/features/shop/screens/home/store/widgets/custom_text_field.dart';
import '../../../../../../utils/constants/sizes.dart';
import 'submit_button.dart';


class ProductAddPage extends StatelessWidget {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: productNameController,
              label: 'Product Name',
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            CustomTextField(
              controller: priceController,
              label: 'Price',
              inputType: TextInputType.number,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            CustomTextField(
              controller: descriptionController,
              label: 'Product Description',
              maxLines: 3,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort),),
                onChanged: (value) {},
                items: ['FOOD', 'SHOES', 'CAR', 'MAKEUP', 'JEWELLRY', 'MACHINE'].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),),
            SizedBox(height: TSizes.spaceBtwItems),
            SubmitButton(
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
}