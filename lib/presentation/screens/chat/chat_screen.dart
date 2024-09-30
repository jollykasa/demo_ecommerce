import 'package:e_commerce_app/presentation/ui_helper/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text(
            "Chat",
            style: headTextStyle(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2815/2815428.png",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2815/2815428.png",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                            "https://natashaskitchen.com/wp-content/uploads/2017/04/Easter-Egg-Chicks-5.jpg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                            "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                            "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                            "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                )),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 8.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: const Offset(0, 3))
                        ]),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                              "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: ProductNameTextStyle(),
                              ),
                              Text("Chat Message")
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ));
  }
}
