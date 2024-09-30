import 'package:e_commerce_app/presentation/screens/cart/bloc/cart_bloc.dart';
import 'package:e_commerce_app/presentation/screens/cart/cart_title_widget.dart';
import 'package:e_commerce_app/presentation/screens/order/order_screen.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Cart",
          style: headTextStyle(),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartNavigateToOrderActionState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderScreen()));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: successState.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartTitle(
                          productDataModel: successState.cartItems[index],
                          cartBloc: cartBloc,
                        );
                      }),
                  Spacer(),
                  Container(
                      width: double.maxFinite,
                      height: 50,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total: ",
                            style: ButtonTextStyle(),
                          ),
                          Text(
                            "\$  ",
                            style: ButtonTextStyle(),
                          ),
                        ],
                      )),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    margin:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        cartBloc.add(CartOrderButtonNavigateEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Order Place",
                            style: ButtonTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
