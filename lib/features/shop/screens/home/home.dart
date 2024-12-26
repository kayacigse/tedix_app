import 'package:flutter/material.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/curved_edges/curved_edges.dart';
import 'package:tedix/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tedix/utils/constants/colors.dart';
import '../../../../common/widget/containers/circular_container.dart';
import '../../../../common/widget/containers/primary_header_container.dart';
import '../../../../common/widget/containers/search_container.dart';
import '../../../../common/widget/curved_edges/curved_edges_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TSearchContainer(text:'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}