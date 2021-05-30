import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:igpazar/store/mode_store.dart';
import 'package:provider/provider.dart';

const TextStyle menuText = TextStyle(
  fontSize: 30.0,
  color: Colors.black,
);
const TextStyle homePageText = TextStyle(fontSize: 50.0, color: Colors.black);


const Color white = Colors.white;
const Color black = Color(0xFF212121);



Color color (BuildContext context,{darkModeColor:black, unDarkModeColor:white}) {
    ModeStore _modeStore = Provider.of<ModeStore>(context, listen: false);

    return _modeStore.darkMode?darkModeColor:unDarkModeColor;

}







