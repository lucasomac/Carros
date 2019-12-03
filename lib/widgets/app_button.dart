import 'package:flutter/material.dart';

class AppButon extends StatelessWidget {
  String text;

  Function onPressed;

  AppButon(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(top: 8),
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        color: Colors.amberAccent,
        onPressed: onPressed,
      ),
    );
  }
}
