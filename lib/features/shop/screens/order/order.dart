import 'package:flutter/material.dart';
import 'package:tedix/features/shop/screens/order/widgets/orders_list.dart';
import '../../../../common/widget/appbar/appbar.dart';



class TOrderScreen extends StatelessWidget {
  const TOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: TOrderListItems(),
      ),
    );
  }
}