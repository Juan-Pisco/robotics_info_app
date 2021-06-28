import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardImage extends StatelessWidget {
  String pathImage;

  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 200.0,
      width: 250.0,
      margin: EdgeInsets.only(
        top: 50.0,
        left: 5.0,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(pathImage),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 12.0,
                offset: Offset(0.0, 5.0))
          ]),
    );
    return Container(
        margin: EdgeInsets.only(),
        child: Stack(
          alignment: Alignment(0.9, 1.1),
          children: <Widget>[card],
        ));
  }
}
