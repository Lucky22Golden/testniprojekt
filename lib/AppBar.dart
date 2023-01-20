import 'package:flutter/material.dart';
import 'package:flutter_meic/Kosara.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Center(
          child: Text(
        "E-trgovina",
        style: TextStyle(color: Colors.black),
      )),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
            onPressed: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MYKosara()));

            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
