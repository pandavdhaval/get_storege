import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("getstore"),
      ),
      body: Center(
        child: GestureDetector(

            child: GestureDetector(
              onTap: ()async{
              GetStorage storage = GetStorage();
              await storage.remove("login");
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              Get.to(LoginPage());
        },
                child: Text("logout"))),
      ),
    );
  }
}
