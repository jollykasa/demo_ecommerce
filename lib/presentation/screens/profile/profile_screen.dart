import 'package:e_commerce_app/presentation/componets/profile_componet.dart';
import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProfile(),
            ContainerMyOrder(),
            ContainerService(),
            const Divider(
              endIndent: 10,
              indent: 10,
            ),
            Text(
              "Settings",
              style: ProductDetailTextStyle(),
            ),
            ProfileSetting(middleTitle: "Account Settings"),
            ProfileSetting(middleTitle: "Address Book Settings"),
            ProfileSetting(middleTitle: "Country"),
            ProfileSetting(middleTitle: "Currency"),
            ProfileSetting(middleTitle: "Language"),
            SizedBox(
              height: 20,
            ),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            SizedBox(
              height: 20,
            ),
            ProfileSetting(middleTitle: "Privacy Settings"),
            ProfileSetting(middleTitle: "Security Settings"),
            ProfileSetting(middleTitle: "Notification Settings"),
            ProfileSetting(middleTitle: "About"),
          ],
        ),
      ),
    ));
  }
}
