import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


import 'home_page.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    var storege = GetStorage();
  var enteremail = TextEditingController();
  var enterpass = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("get storege"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                controller: enteremail,
                validator: (val){
                  if(val!.isEmpty){
                    return "Enter Email";
                  }
                  else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(val!)
                  ){
                    return "Enter Valid Email";
                  }
                },
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  // ),
                  hintText: "enter email",
                ),
              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: enterpass,
                validator: (val){
                  if(val!.isEmpty){
                    return "enter password";
                  }
                  else if(val.length <=8){
                    return "enter 8 char";
                  }
                },
                decoration: InputDecoration(
                  hintText: "pasword",
                ),
              ),

              SizedBox(height: 20,),

              Column(
                children: [
                  GestureDetector(
                    onTap: ()async{
                      if(_formkey.currentState!.validate()){
                        print("hello");

                        GetStorage storege= GetStorage();
                        storege.write("login", "storege");
                       print (storege.read("login"));
                        Get.to(HomePage());
                      }
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                    },

                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("save",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
