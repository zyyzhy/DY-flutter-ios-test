import 'package:flutter/material.dart';

class PrimaryTag extends StatelessWidget {

final String text;
final VoidCallback onPressed;
final Color textColor;
final Color bgColor;

const PrimaryTag({Key key, this.text, this.onPressed,this.textColor,this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: this.onPressed,
      child: Container(
        height: 28,
        padding: EdgeInsets.only(left: 14,right: 14,top: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: bgColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Text(this.text,
          style: TextStyle(
          color: this.textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
