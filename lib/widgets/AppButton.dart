import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButon extends StatelessWidget {
  String text;
  Function onPressed;

  AppButon(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.amberAccent,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
