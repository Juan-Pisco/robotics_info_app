import 'package:flutter/material.dart';
import 'package:robotics_community_app/utils/card_image_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Components extends StatefulWidget {
  const Components({Key key}) : super(key: key);

  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  String foto_descri =
      "Lorem ipsum dolor sit amet, consectetur adipiscing id dictum velit consequat. Duis semper nibh purus, quis convallis risus sodales ac. Class aptent taciti.";
  String foto_uti =
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
            foto_uti,
            'https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget',
            'https://www.youtube.com/watch?v=dVXJDjgCpho',
            '',
            '¿Por qué pregunta 1?',
            '¿Por qué pregunta 2?'),
        SingleComponent(
            'Potenciómetro', '', '', '', '', '', '', '', '', '', ''),
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
  final String extra_info;
  final String video1;
  final String video2;
  final String video1txt;
  final String video2txt;

  int current_section = 0;
  Color info_color = Color(0xffBDE3BE);
  Color videos_color = Color(0xffBDE3BE);
  Color preguntas_color = Color(0xffBDE3BE);

  SingleComponent(
      this.name,
      this.image1,
      this.image2,
      this.image3,
      this.description,
      this.utilities,
      this.extra_info,
      this.video1,
      this.video2,
      this.video1txt,
      this.video2txt);

  @override
  _SingleComponentState createState() => _SingleComponentState();
}

class _SingleComponentState extends State<SingleComponent> {
  PageController pageController = PageController(initialPage: 0);
  _optionSelected(int index) {
    setState(() {
      widget.current_section = index;
      widget.videos_color = Color(0xffBDE3BE);
      widget.preguntas_color = Color(0xffBDE3BE);
      widget.info_color = Color(0xffBDE3BE);
      if (index == 0) {
        debugPrint('${widget.current_section}');
        widget.info_color = Color(0xff4AB14E);
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 250), curve: Curves.decelerate);
      } else if (index == 1) {
        debugPrint("${widget.current_section}");
        widget.videos_color = Color(0xff4AB14E);
        pageController.animateToPage(1,
            duration: Duration(milliseconds: 250), curve: Curves.decelerate);
      } else if (index == 2) {
        debugPrint("${widget.current_section}");
        widget.preguntas_color = Color(0xff4AB14E);
        pageController.animateToPage(2,
            duration: Duration(milliseconds: 250), curve: Curves.decelerate);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.info_color = Color(0xff4AB14E);
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

          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) => _optionSelected(index),
              physics: NeverScrollableScrollPhysics(),
              children: [
                ComponentDescription(widget.description, widget.utilities,
                    widget.name, widget.extra_info),
                ComponentVideos(widget.video1, widget.video2, widget.video1txt,
                    widget.video2txt),
                Container(color: Colors.green)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ComponentDescription extends StatelessWidget {
  final String description_text;
  final String utilities_text;
  final String name;
  final String info_link;
  const ComponentDescription(
      this.description_text, this.utilities_text, this.name, this.info_link);

  @override
  Widget build(BuildContext context) {
    return (Column(
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
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Row(
            children: [
              Text(
                'Para más información ',
                style: TextStyle(fontSize: 15),
              ),
              InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  child: Text(
                    'click aquí.',
                    style: TextStyle(
                        color: Colors.blue.shade400,
                        fontStyle: FontStyle.italic),
                  ),
                  onTap: () => launch('${this.info_link}'))
            ],
          ),
        )
      ],
    ));
  }
}

class ComponentVideos extends StatelessWidget {
  final String video1txt;
  final String video2txt;
  final String video1;
  final String video2;
  

  const ComponentVideos(
      this.video1, this.video2, this.video1txt, this.video2txt);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 15, right: 15),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            child: Column(
              children: [
                Text('${this.video1txt}'),
                //YoutubePlayer(context: context, videoId: YoutubePlayer.convertUrlToId(this.video1))
              ],
            ),alignment: Alignment.topCenter,
            ),
          
          
        ],
      ),
    );
  }
}
