import 'package:e_commerce_app/presentation/routes/generated_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 1.0,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              backgroundColor: Colors.redAccent)),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
