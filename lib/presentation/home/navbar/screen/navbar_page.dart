import 'package:aplikasi_sederhana/common/components/font_weight.dart';
import 'package:aplikasi_sederhana/common/constants/colors.dart';
import 'package:aplikasi_sederhana/presentation/account/screen/account_page.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../common/constants/app_text_style.dart';
import '../../../../common/constants/images.dart';
import '../../../cart/screen/cart_page.dart';
import '../../dashboard/screen/home_page.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    // const AccountPage(),
    // Text('Home'),
    // Text('Cart'),

    const AccountPage(),
    // Text('Account'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // make navbar without bloc
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: AppTextStyle.body4.semiBold,
        unselectedLabelStyle: AppTextStyle.body4.semiBold,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: PrimaryColor.pr10,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconHome)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: Text('0'),
              child: ImageIcon(
                AssetImage(Images.iconCart),
                color: Colors.black,
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconUser)),
            label: 'Account',
          ),
        ],
      ),
    );

    // return BlocProvider(
    //   create: (context) =>
    //       CartBloc(), // Replace with the actual initialization of your CartBloc
    //   child: Scaffold(
    //     body: _pages[_selectedIndex],
    //     bottomNavigationBar: BottomNavigationBar(
    //       selectedLabelStyle: AppTextStyle.body4.semiBold,
    //       unselectedLabelStyle: AppTextStyle.body4.semiBold,
    //       type: BottomNavigationBarType.fixed,
    //       currentIndex: _selectedIndex,
    //       selectedItemColor: PrimaryColor.pr10,
    //       onTap: _onItemTapped,
    //       items: [
    //         const BottomNavigationBarItem(
    //           icon: ImageIcon(AssetImage(Images.iconHome)),
    //           label: 'Home',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: badges.Badge(
    //             badgeContent: BlocBuilder<CartBloc, CartState>(
    //               builder: (context, state) {
    //                 return state.maybeWhen(
    //                   orElse: () => const Text('0'),
    //                   success: (carts) {
    //                     int totalQty = 0;
    //                     for (var cart in carts) {
    //                       totalQty += cart.quantity;
    //                     }
    //                     return Text(
    //                       totalQty.toString(),
    //                       style: const TextStyle(color: Colors.white),
    //                     );
    //                   },
    //                 );
    //               },
    //             ),
    //             child: const ImageIcon(
    //               AssetImage(Images.iconCart),
    //               color: Colors.black,
    //             ),
    //           ),
    //           label: 'Cart',
    //         ),
    //         const BottomNavigationBarItem(
    //           icon: ImageIcon(AssetImage(Images.iconUser)),
    //           label: 'Account',
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
