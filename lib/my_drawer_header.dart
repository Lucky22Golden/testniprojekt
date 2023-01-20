import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meic/MyContainer.dart';
import 'package:flutter_meic/Roba.dart';
import 'package:flutter_meic/Kosara.dart';
import 'AppBar.dart';
import 'Navigation.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "E-trgovina", home: MyHomePage());
  }
}

//prva stranica
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: MyAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MYHomePage("muski", true)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Muška",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MYHomePage("zene", true)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      shape: StadiumBorder()),
                  child: Text(
                    "Ženska",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MYHomePage("djeca", true)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  "Dječja",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ));
  }
}

class MYHomePage extends StatefulWidget {
  String? kategorija;
  bool? spol;
  MYHomePage(this.kategorija, this.spol);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MYHomePage> {
  List<Roba> li = [];
  int vrati() {
    for (var name in lista) {
      if (widget.spol == true) {
        if (name.spol == widget.kategorija) {
          li.add(name);
        } else if (widget.kategorija == name.vrsta) {
          li.add(name);
        }
      }
    }
    return li.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: MyAppBar(),
        body: ListView.builder(
          itemCount: vrati(),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                    height: 300,
                    width: 500,
                    color: Colors.deepOrange,
                    child: Column(
                      children: [
                        Container(
                          height: 260,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(li[index].slika),
                                  fit: BoxFit.fitHeight)),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(children: [
                              Text(
                                li[index].naziv +
                                    "  " +
                                    li[index].cijena.toString(),
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    kosara.dodaj(li[index]);
                                    final snackBar = SnackBar(
                                      content: const Text('Dodali ste proizvod u košaru!'),
                                      backgroundColor: (Colors.yellowAccent),
                                      action: SnackBarAction(
                                        label: 'Makni',
                                        onPressed: () {
                                        },
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  },
                                  child: Text("Klik"))
                            ])),
                      ],
                    )));
          },
        ));
  }
}
