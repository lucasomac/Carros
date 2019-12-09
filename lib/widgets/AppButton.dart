import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButon extends StatelessWidget {
  String text;
  Function onPressed;
  bool showProgress;

  AppButon(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.amberAccent,
        child: showProgress
            ? Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : Text(
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
