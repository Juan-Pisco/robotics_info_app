import 'package:flutter/material.dart';
import 'package:robotics_community_app/utils/card_image_list.dart';

class Components extends StatefulWidget {
  const Components({Key key}) : super(key: key);

  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      children: [
        SingleComp('Fotorresistor', 'assets/images/fotor1.png',
            'assets/images/fotor2.png', 'assets/images/fotor3.png', '', ''),
        SingleComp('Potenciómetro', '', '', '', '', ''),
        Testing(Colors.blue),
        Testing(Colors.green),
      ],
    );
  }
}

class Testing extends StatelessWidget {
  final Color color;
  const Testing(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
    );
  }
}

class SingleComp extends StatelessWidget {
  final String name;
  final String image1;
  final String image2;
  final String image3;
  final String description;
  final String utilities;

  const SingleComp(this.name, this.image1, this.image2, this.image3,
      this.description, this.utilities);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff333333),
      body: Column(
        children: [
          Container(
            child: Text(
              this.name,
              style: TextStyle(
                  color: Color(0xff4AB14E),
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 50),
          ),
          CardImageList(this.image1, this.image2, this.image3),
          NavigationRow()

        ],
      ),
    );
  }
}

class NavigationRow extends StatefulWidget {
  const NavigationRow({ Key key }) : super(key: key);

  @override
  _NavigationRowState createState() => _NavigationRowState();
}

class _NavigationRowState extends State<NavigationRow> {
  
  int current_section = 0;
  Color info_color = Color(0xffBDE3BE);
  Color videos_color = Color(0xffBDE3BE);
  Color preguntas_color = Color(0xffBDE3BE);
  
   _optionSelected(int index) {
    setState(() {
      current_section = index;
      videos_color = Color(0xffBDE3BE);
      preguntas_color = Color(0xffBDE3BE);
      info_color = Color(0xffBDE3BE);
      if (index == 0) {
        debugPrint("Hola");
        info_color = Color(0xff4AB14E);
      }
      else if (index == 1) {
        debugPrint("Hola2");
        videos_color = Color(0xff4AB14E);
      }else if (index == 2) {
        debugPrint("Hola3");
        preguntas_color = Color(0xff4AB14E);
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:28.0),
      child: ButtonBar(
        //mainAxisSize: MainAxisSize.values[1],
        buttonPadding: EdgeInsets.only(right:1, top: 8, left: 8, bottom: 8),
        alignment: MainAxisAlignment.start,
        children: [
          FlatButton(onPressed: _optionSelected(0), child: Text('Información', style: TextStyle(fontSize: 17, color: info_color),)),
          FlatButton(onPressed: _optionSelected(1), child: Text('Videos', style: TextStyle(fontSize: 17, color: videos_color),)),
          FlatButton(onPressed: _optionSelected(2), child: Text('Preguntas', style: TextStyle(fontSize: 17, color: preguntas_color),)),
        ],
      ),
    );
  }
}