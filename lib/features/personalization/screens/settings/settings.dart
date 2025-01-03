import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/containers/primary_header_container.dart';
import 'package:tedix/common/widget/texts/section_heading.dart';
import 'package:tedix/common/widget/texts/settings_menu_text.dart';
import 'package:tedix/features/authentication/screens/login/login.dart';
import '../../../../common/widget/texts/user_profile_text.dart';
import '../../../shop/screens/order/order.dart';

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
                TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),),
                TUserProfileText(
                    text:'TEDEX',
                    sublineText: 'supportedix@gmail.com'),
                SizedBox(height: 32),
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
              children: [
                TSectionHeading(title: 'Account Settings', showActionButton: false,),
                SizedBox(height: 32),

                TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Products', subtitle: 'See the products you have loaded', onTap: (){} ),
                TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'Requests', subtitle: 'See the requests you have gotten', onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const TOrderScreen()));} ),

                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));},
                    child: const Text('Logout'),
                  ),
                ),
                const SizedBox(height: 80),
              ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}

