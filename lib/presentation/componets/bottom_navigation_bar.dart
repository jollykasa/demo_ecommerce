import 'package:e_commerce_app/data/cart_items.dart';
import 'package:e_commerce_app/data/wishlist_items.dart';
import 'package:e_commerce_app/presentation/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/presentation/screens/chat/chat_screen.dart';
import 'package:e_commerce_app/presentation/screens/home/home_screen.dart';
import 'package:e_commerce_app/presentation/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/presentation/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
//badges
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';

class BottomNavBar {
  List<BottomNavigationBarItem> bottomNavItem = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home',
        activeIcon: Icon(Icons.home)),
    BottomNavigationBarItem(
      icon: badges.Badge(
          badgeContent: Text(
            cartItems.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.shopping_cart_outlined)),
      activeIcon: badges.Badge(
          badgeContent: Text(
            cartItems.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.shopping_cart)),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.chat_outlined),
        label: 'Chat',
        activeIcon: Icon(Icons.chat)),
    BottomNavigationBarItem(
      icon: badges.Badge(
          badgeContent: Text(
            wishlistItems.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.favorite_border)),
      activeIcon: badges.Badge(
          badgeContent: Text(
            wishlistItems.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.favorite)),
      label: 'Wishlist',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        label: 'Profile',
        activeIcon: Icon(Icons.person))
  ];

  List<Widget> bottomNavScreen = <Widget>[
    HomeScreen(),
    CartScreen(),
    const ChatScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];
}
