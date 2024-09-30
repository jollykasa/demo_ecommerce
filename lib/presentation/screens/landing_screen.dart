import 'package:e_commerce_app/business_logic/landing_screen_bloc/landing_screen_bloc.dart';
import 'package:e_commerce_app/presentation/componets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late PageController _pageController = PageController();
    void initState() {
      _pageController = PageController();
    }

    @override
    void dispose() {
      _pageController.dispose();
    }

    return BlocConsumer<LandingScreenBloc, LandingScreenState>(
        listener: (context, state) {},
        builder: ((context, state) {
          return Scaffold(
              body: PageView(
                controller: _pageController,
                children: [
                  Center(
                      child: BottomNavBar()
                          .bottomNavScreen
                          .elementAt(state.tabIndex)),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: BottomNavBar().bottomNavItem,
                currentIndex: state.tabIndex,
                selectedItemColor: Colors.redAccent,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  BlocProvider.of<LandingScreenBloc>(context)
                      .add(TabChange(tabIndex: index));
                },
              ));
        }));
  }
}
