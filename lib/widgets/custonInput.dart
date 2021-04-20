import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placehorder;
  final TextEditingController textcontroller;
  final TextInputType keyboardType;
  final bool isPassword;
  final int maxline;
  const CustomInput(
      {Key key,
      @required this.icon,
      @required this.placehorder,
      @required this.textcontroller,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.maxline = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5,
                )
              ]),
          child: TextField(
            controller: this.textcontroller,
            maxLines: this.maxline,
            autocorrect: false,
            keyboardType: this.keyboardType,
            obscureText: this.isPassword,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  this.icon,
                  size: Theme.of(context).textTheme.headline3.fontSize,
                  color: Theme.of(context).iconTheme.color,
                ),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: Theme.of(context).textTheme.headline3.color,
                    fontFamily:
                        Theme.of(context).textTheme.headline4.fontFamily,
                    fontSize: Theme.of(context).textTheme.headline3.fontSize),
                hintText: this.placehorder),
          )),
    );
  }
}
