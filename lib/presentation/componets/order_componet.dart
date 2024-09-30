import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';

class IconHead extends StatelessWidget {
  const IconHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      height: 90,
      color: Colors.redAccent.withOpacity(0.5),
      child: Row(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_shipping,
                size: 50,
              ),
              Text("Shipping")
            ],
          ),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 20,
              width: 100,
              child: const Divider(
                color: Colors.black,
              )),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.payment,
                size: 50,
              ),
              Text("Payment")
            ],
          ),
          Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 20,
              width: 100,
              child: const Divider(
                color: Colors.black,
              )),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delivery_dining_sharp,
                color: Colors.black45,
                size: 50,
              ),
              Text(
                "Delivery",
                style: TextStyle(
                  color: Colors.black45,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RadioButtonClick extends StatefulWidget {
  const RadioButtonClick({super.key});

  @override
  State<RadioButtonClick> createState() => _RadioButtonClickState();
}

class _RadioButtonClickState extends State<RadioButtonClick> {
  @override
  TypePayment? _typePayment;
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        RadioListTile<TypePayment>(
          value: TypePayment.CashonDelivery,
          groupValue: _typePayment,
          title: Text(
            "Cash on Delivery",
            style: ProductDetailTextStyle(),
          ),
          onChanged: (value) {
            setState(() {
              _typePayment = value;
            });
          },
        ),
        RadioListTile<TypePayment>(
          value: TypePayment.CreditDebitCard,
          groupValue: _typePayment,
          title: Text("Credit/Debit Card", style: ProductDetailTextStyle()),
          onChanged: (value) {
            setState(() {
              _typePayment = value;
            });
          },
        )
      ],
    ));
  }
}

enum TypePayment { CashonDelivery, CreditDebitCard }




//List title for the list of items
// class PaymentCom extends StatelessWidget {
//   final Icon? icon;
//   final String middleTitle;

//   const PaymentCom({super.key, this.icon, required this.middleTitle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
//       child: ListTile(
//         leading: icon,
//         title: Text(
//           middleTitle,
//           style: ProductDetailTextStyle(),
//         ),
//         trailing: const Icon(
//           Icons.circle_outlined,
//           size: 20,
//         ),
//       ),
//     );
//   }
// }