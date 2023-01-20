import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meic/Info.dart';

import 'AppBar.dart';
import 'Navigation.dart';
import 'Roba.dart';

List<Roba> lista_kosara = [];
bool empty = true;

class kosara {
  HashMap map = HashMap<int, int>();
  static void provjera() {
    if (lista_kosara.length != 0) {
      empty = false;
    }
  }
static vratiProvjeru(){
    return empty;
}
  static void dodaj(Roba a) {
    bool ponavljanje=false;
    for (var name in lista_kosara) {
      if (name.id == a.id) {
        ponavljanje=true;
      }
    }
    if(ponavljanje==false){
    lista_kosara.add(a);
    provjera();
  }
  }

  static void makni(int b) {
    for (var name in lista_kosara) {
      if (name.id == b) {
        lista_kosara.remove(name);
      }
    }
    provjera();
  }

  static int iznos(){
    int suma=0;
    for (var name in lista_kosara) {

        suma=suma+name.cijena*name.kolicina;

    }
    return suma;
  }
  static List<Roba> posaljiListu(){
    return lista_kosara;
  }
}

class MYKosara extends StatefulWidget {
  @override
  _MYKosara createState() => _MYKosara();
}

class _MYKosara extends State<MYKosara> {
//List<Roba> al = Roba.get_popis();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: MyAppBar(),
      body: ListView.builder(
          itemCount: lista_kosara.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                    height: 305,
                    width: 500,
                    color: Colors.deepOrange,
                    child: Column(
                      children: [
                        Container(
                          height: 260,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(lista_kosara[index].slika),
                                  fit: BoxFit.fitHeight)),
                        ),
                        Text(lista_kosara[index].naziv +
                            "  " +
                            lista_kosara[index].cijena.toString()),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    kosara.makni(lista_kosara[index].id);
                                  });
                                },
                                child: Text("Makni")),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    lista_kosara[index].minusRoba();
                                  });
                                },
                                child: Text("-")),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    lista_kosara[index].plusRoba();
                                  });
                                },
                                child: Text("+")),
                            Text(lista_kosara[index].kolicina.toString())
                          ],
                        )
                      ],
                    )));
          }),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.deepOrangeAccent,
        child: Row(
          children: [
            ElevatedButton(
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
              child: Text('Submit'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info() ));
              },
            ),
            Text("Iznos:"+kosara.iznos().toString())
          ],
        ),
      ),
    );
  }
}
