import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  
  final String image1;
  final String image2;
  final String image3;

  const CardImageList(this.image1, this.image2, this.image3);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:0, right:10),
      height: 250.0,
      child: ListView(
        padding: EdgeInsets.only(top:0, left: 10, right: 10, bottom: 20 ),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          CardImage(this.image1),
          CardImage(this.image2),
          CardImage(this.image3),
        ],
      ),
    );
  }
}
