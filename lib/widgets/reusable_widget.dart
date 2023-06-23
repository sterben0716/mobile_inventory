import 'package:flutter/material.dart';

Image logoWidget(String imagename){
  return Image.asset(
      imagename,
      fit: BoxFit.fitWidth,
      width: 350,
      height: 270
  );
}
