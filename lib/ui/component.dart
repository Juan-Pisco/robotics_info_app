import 'package:flutter/material.dart';
import 'package:robotics_community_app/utils/card_image_list.dart';

class Components extends StatefulWidget {
  const Components({Key key}) : super(key: key);

  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  String foto_descri =
      "Lorem ipsum dolor sit amet, consectetur adipiscing id dictum velit consequat. Duis semper nibh purus, quis convallis risus sodales ac. Class aptent taciti.";

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      children: [
        SingleComponent(
            'Fotorresistor',
            'assets/images/fotor1.png',
            'assets/images/fotor2.png',
            'assets/images/fotor3.png',
            foto_descri,
            '',
            '',
            ''),
        SingleComponent('Potenciómetro', '', '', '', '', '', '', ''),
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

class SingleComponent extends StatefulWidget {
  final String name;
  final String image1;
  final String image2;
  final String image3;
  final String description;
  final String utilities;
  final String video1;
  final String video2;

  int current_section = 0;
  Color info_color = Color(0xffBDE3BE);
  Color videos_color = Color(0xffBDE3BE);
  Color preguntas_color = Color(0xffBDE3BE);


  SingleComponent(this.name, this.image1, this.image2, this.image3,
      this.description, this.utilities, this.video1, this.video2);



  @override
  _SingleComponentState createState() => _SingleComponentState();
}

class _SingleComponentState extends State<SingleComponent> {
  // TODO: Add and fix the index widgets

 /*     var temp = ComponentDescription(this.description, "Hola", name);
      List widget_printed = [
      temp,
      ]; */

  _optionSelected(int index) {
    setState(() {
      widget.current_section = index;
      widget.videos_color = Color(0xffBDE3BE);
      widget.preguntas_color = Color(0xffBDE3BE);
      widget.info_color = Color(0xffBDE3BE);
      if (index == 0) {
        debugPrint('${widget.current_section}');
        widget.info_color = Color(0xff4AB14E);
      } else if (index == 1) {
        debugPrint("${widget.current_section}");
        widget.videos_color = Color(0xff4AB14E);
      } else if (index == 2) {
        debugPrint("${widget.current_section}");
        widget.preguntas_color = Color(0xff4AB14E);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff333333),
      body: Column(
        children: [
          Container(
            child: Text(
              widget.name,
              style: TextStyle(
                  color: Color(0xff4AB14E),
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 50),
          ),
          CardImageList(widget.image1, widget.image2, widget.image3),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                    onPressed: () => _optionSelected(0),
                    child: Text(
                      'Información',
                      style: TextStyle(
                          fontSize: 18.5,
                          color: widget.info_color,
                          fontWeight: FontWeight.w600),
                    )),
                FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                    onPressed: () => _optionSelected(1),
                    child: Text(
                      'Videos',
                      style: TextStyle(
                          fontSize: 18.5,
                          color: widget.videos_color,
                          fontWeight: FontWeight.w600),
                    )),
                FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                    onPressed: () => _optionSelected(2),
                    child: Text(
                      'Preguntas',
                      style: TextStyle(
                          fontSize: 18.5,
                          color: widget.preguntas_color,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
          //widget_printed[widget.current_section],
          ComponentDescription(widget.description, "Hola", widget.name),
        ],
      ),
    );
  }
}

class ComponentDescription extends StatelessWidget {
  final String description_text;
  final String utilities_text;
  final String name;
  const ComponentDescription(
      this.description_text, this.utilities_text, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                '¿Qué es el ${this.name.toLowerCase()}?',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                this.description_text,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                '¿Dónde lo podemos encontrar?',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                this.utilities_text,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
