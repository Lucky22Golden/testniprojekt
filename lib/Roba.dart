
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Roba {
  int id;
  String naziv;
  int cijena;
  String vrsta;
  String spol;
  String slika;
  int kolicina = 1;

  Roba(
      { required this.id, required this.naziv, required this.cijena, required this.vrsta, required this.spol, required this.slika});

  static List<Roba> get_popis() {
    return lista;
  }

  void plusRoba() {
    kolicina++;
  }

  void minusRoba() {
    if (kolicina > 1) {
      kolicina--;
    }
  }
}
List<Roba> lista=[
  Roba(id:1,naziv: "Nike majca", cijena: 250, vrsta: "majca", spol: "muski",slika: "slike/nikemajca.jpg"),
  Roba(id:2,naziv: "Adidas jaketa", cijena: 300, vrsta: "jaketa", spol: "zene", slika: "slike/adidasjaketa.jpg"),
  Roba(id:3,naziv: "Puma carape", cijena: 100, vrsta: "carape", spol: "djeca",slika: "slike/carapepuma.jpg")
];