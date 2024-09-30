import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, bottom: 25),
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 247, 148, 148),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
                "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                height: 70,
                width: 70,
                fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Ahmed Hammad ",
            style: ProductNameTextStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowList(
                number: "5",
                NumTitle: "Wishlist",
              ),
              const SizedBox(
                width: 20,
              ),
              VerDivider(),
              const SizedBox(
                width: 20,
              ),
              RowList(
                number: "10",
                NumTitle: "Coupons",
              ),
              const SizedBox(
                width: 20,
              ),
              VerDivider(),
              const SizedBox(
                width: 20,
              ),
              RowList(
                number: "55",
                NumTitle: "Points",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowList extends StatelessWidget {
  final String number;
  final String NumTitle;
  RowList({super.key, required this.number, required this.NumTitle});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        number,
        style: total2TextStyle(),
      ),
      Text(
        NumTitle,
        style: total2TextStyle(),
      )
    ]);
  }
}

class VerDivider extends StatelessWidget {
  const VerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: VerticalDivider(
          color: Colors.black,
        ));
  }
}

class ContainerMyOrder extends StatelessWidget {
  ContainerMyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.55),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Order",
                style: total2TextStyle(),
              ),
              Text("view all")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.pending_actions,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pending',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.history,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Processing',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.local_shipping_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Shipped',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.chat_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Review',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Preorder',
                    style: MyorderTextStyle(),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ContainerService extends StatelessWidget {
  ContainerService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.55),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Services",
                style: total2TextStyle(),
              ),
              Text("view all")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.folder_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Browsing',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Addressing',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Support',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.circle_notifications_outlined,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Notification',
                    style: MyorderTextStyle(),
                  )
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'About Us',
                    style: MyorderTextStyle(),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProfileSetting extends StatelessWidget {
  final String middleTitle;
  const ProfileSetting({super.key, required this.middleTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
      child: ListTile(
        title: Text(
          middleTitle,
          style: ProductDetailTextStyle(),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ),
    );
  }
}
