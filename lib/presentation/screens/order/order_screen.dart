import 'package:e_commerce_app/presentation/componets/order_componet.dart';
import 'package:e_commerce_app/presentation/screens/home/home_screen.dart';
import 'package:e_commerce_app/presentation/screens/order/bloc/order_bloc.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderBloc orderBloc = OrderBloc();
    String address = "", phone = "", name = "", office = "";

    TextEditingController addresscontroller = new TextEditingController();
    TextEditingController namecontroller = new TextEditingController();
    TextEditingController phonecontroller = new TextEditingController();
    TextEditingController officeaddresscontroller = new TextEditingController();

    final _formkey = GlobalKey<FormState>();
    return BlocConsumer<OrderBloc, OrderState>(
      bloc: orderBloc,
      listenWhen: (previous, current) => current is OrderActionState,
      buildWhen: (previous, current) => current is! OrderActionState,
      listener: (context, state) {
        if (state is OrderNativatedToHomeActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Order Confirm ")));
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (newContext) => HomeScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "Order ",
                style: headTextStyle(),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  IconHead(),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formkey,
                    child: Card(
                      // color: Color.fromARGB(255, 250, 213, 213),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Fill Following Form",
                              style: ProductNameDetailTextStyle(),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "Address",
                              style: ProductDetailTextStyle(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            child: TextFormField(
                              controller: addresscontroller,
                              validator: (value) {
                                if (value == null || value!.isEmpty) {
                                  return 'Please Enter Address';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter Your Address",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.location_history,
                                    size: 40,
                                  )),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: 150, child: const Divider()),
                              Text(" OR "),
                              Container(width: 150, child: const Divider()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "Office Address",
                              style: ProductDetailTextStyle(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            child: TextFormField(
                              controller: officeaddresscontroller,
                              validator: (value) {
                                if (addresscontroller.text.isEmpty) {
                                  return 'Please Enter Office Address';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter Your Office Address",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.location_history,
                                    size: 40,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "Name",
                              style: ProductDetailTextStyle(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            child: TextFormField(
                              controller: namecontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter Your Name",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.person_2_rounded,
                                    size: 40,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "Phone Number",
                              style: ProductDetailTextStyle(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1.0, color: Colors.black38)),
                            child: TextFormField(
                              controller: phonecontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter phone number ';
                                } else if (value.length != 10) {
                                  return 'Please Enter phone number correctly ';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter Your Phone Number",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                    size: 40,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "Select Payment Method",
                              style: ProductDetailTextStyle(),
                            ),
                          ),
                          //list Tile which is shown
                          // const PaymentCom(
                          //   icon: Icon(Icons.payments_outlined),
                          //   middleTitle: "Cash on Delivery",
                          // ),
                          // const PaymentCom(
                          //   icon: Icon(Icons.credit_card),
                          //   middleTitle: "Credit/Debit Card",
                          // ),
                          RadioButtonClick()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          orderBloc.add(OrderHomeButtonNavigateEvent());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Confirm and Continue",
                            style: ButtonTextStyle(),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
