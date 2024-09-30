import 'package:e_commerce_app/presentation/screens/wishlist/bloc/wishlist_bloc.dart';
import 'package:e_commerce_app/presentation/screens/wishlist/wishlist_title_widget.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Favorites",
          style: headTextStyle(),
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTitle(
                      productDataModel: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc,
                    );
                  });
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
