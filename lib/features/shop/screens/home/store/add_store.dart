import 'package:flutter/material.dart';
import 'package:tedix/features/shop/screens/home/store/widgets/product_add.dart';

import '../../../../../common/widget/appbar/appbar.dart';

class AddStoreScreen extends StatelessWidget {
  const AddStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Add Product',style: Theme.of(context).textTheme.headlineMedium)),
      body: ProductAddPage(),

    );
  }
}



