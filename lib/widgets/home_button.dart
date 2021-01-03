import 'package:flutter/material.dart';

import '../const.dart';

class HomeButton extends StatelessWidget {
  final String text;

  HomeButton({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FlatButton(
        onPressed: () {},
        child: Container(
          child: Center(
              child: Text(
            text,
            style: homePageText,
          )),
          height: 180.0,
          width: 500.0,
          decoration: BoxDecoration(
            color: Color(0xFFF5F5DC),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
