import 'package:e_commerce_app/business_logic/landing_screen_bloc/landing_screen_bloc.dart';
import 'package:e_commerce_app/presentation/screens/landing_screen.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  final LandingScreenBloc landingScreenBloc = LandingScreenBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LandingScreenBloc>.value(
                  value: landingScreenBloc,
                  child: const LandingScreen(),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Error Screen"),
          ),
          body: Center(child: Text("ERROR", style: errorTextStyle())));
    });
  }
}
