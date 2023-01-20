


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meic/Narudba.dart';
import 'AppBar.dart';
import 'Navigation.dart';

class Info extends StatefulWidget{
  @override
  _Info createState() => _Info();
}


class _Info extends State<Info>{
  TextEditingController inputcontroller = new TextEditingController();
  TextEditingController inputcontroller1 = new TextEditingController();
  String s="Submit";
  String n="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: NavDrawer(),
      body: Column(children: [
         TextField(controller: inputcontroller,decoration: InputDecoration(label: Text("Email"),border: OutlineInputBorder()),),
        TextField(controller: inputcontroller1,decoration: InputDecoration(label: Text("Phone"),border: OutlineInputBorder()),),
        Center(child:ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
            ),
          ),
          child: Text("Submit"),
          onPressed: () {setState(() {
            narudba.postavi(inputcontroller.text, inputcontroller1.text);
            narudba.posalji(inputcontroller.text, inputcontroller1.text);
            s=inputcontroller1.text;
            n=inputcontroller.text;
          });

          },
        ),),
        Text("Phone:"+"$s"+"--Email:$n")
      ],),
    );
  }


}