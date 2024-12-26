import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/containers/primary_header_container.dart';
import 'package:tedix/common/widget/texts/section_heading.dart';
import 'package:tedix/common/widget/texts/settings_menu_text.dart';
import '../../../../common/widget/texts/user_profile_text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
              children:[
                TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),),
                TUserProfileText(
                    text:'TEDEX',
                    sublineText: 'supportedix@gmail.com'),
                SizedBox(height: TSizes.spaceBtwItems),
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
              children: [
                TSectionHeading(title: 'Account Settings', showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwSections),

                TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Products', subtitle: 'See the products you have loaded', onTap: (){} ),
                TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'Requests', subtitle: 'See the requests you have gotten', onTap: (){} ),

                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Logout'),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}

