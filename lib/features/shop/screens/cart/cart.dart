import 'package:flutter/material.dart';
import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/products/cart/cart_items.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/sizes.dart';
import '../succes_screen/succes_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessScreen(title: 'Your Request Has Been Received', onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationMenu(),),);},),),);}, child: Text('Request'),),
      ),
    );
  }
}

