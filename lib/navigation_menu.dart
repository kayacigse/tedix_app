import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/features/personalization/screens/settings/settings.dart';
import 'package:tedix/features/shop/screens/home/home.dart';
import 'features/shop/screens/cart/cart.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});
  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int index = 0;
  final screens = [
    const HomeScreen(),
    const CartScreen(),
    const SettingsScreen(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Add Product'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
      body: screens[index],

    );
  }
}

