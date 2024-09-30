import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderHomeScreen extends StatelessWidget {
  const HeaderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.redAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: headerTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/location.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "New Yok,USA",
                        style: headerTextStyle(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.notification_add_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(1),
                      filled: true,
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue, width: 2)),
                      hintStyle: searchTextStyle()),
                ),
              )
            ],
          ),
        ));
  }
}
