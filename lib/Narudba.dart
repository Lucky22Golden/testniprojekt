

import 'package:flutter_meic/Kosara.dart';

import 'Roba.dart';

class narudba{
 static String? email;
 static String? phone;

 static void postavi(String e,String p){
   email=e;
   phone=p;
 }
static String? vratiemail(){
   return email;
}

 static void posalji(String e, String p){
   List<Roba> a=kosara.posaljiListu();

   //posalje u bazu podataka email,phone i listu
 }


}