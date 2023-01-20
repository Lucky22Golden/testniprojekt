

import 'package:flutter/material.dart';

class MyContainer {
 bool spol=false;
 bool roba=false;
 String aa="aa";
 void postavi_spol(String a){
   spol=true;
   roba=false;
   aa=a;
 }
void postavi_robu(String b){
   spol=false;
   roba=true;
   aa=b;
}
}

