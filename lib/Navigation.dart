import 'package:flutter/material.dart';

import 'my_drawer_header.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            "Menu",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          decoration: BoxDecoration(color: Colors.black38),
        ),
        ListTile(
            leading: Icon(Icons.input),
            title: Text("St art"),
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  )
                }),
        ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Jakne"),
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MYHomePage("jaketa", true)),
                  )
                }),
        ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Majce"),
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MYHomePage("majca", true)),
                  )
                }),
        ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Čarape"),
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MYHomePage("carape", true)),
                  )
                }),
        ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Hlače"),
            onTap: () => {}),
        ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Patike"),
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MYHomePage("patike", true)),
                  )
                })
      ],
    ));
  }
}
