class RoboticItem {
  final String name;
  final String image1;
  final String image2;
  final String image3;
  final String description;
  final String utilities;
  final String video1;
  final String video2;

  const RoboticItem(this.name, this.image1, this.image2, this.image3, this.description, this.utilities, this.video1, this.video2);
}

const RoboticItem persona = RoboticItem('Fotorresitor', 'assets/images/fotor1.png', 'assets/images/fotor4.png', 'assets/images/fotor3.png', 'Esto es un sensor de luz.', 'Sirve para muchas cosas.', 'https://www.youtube.com/watch?v=RbZWnSL40a4', 'https://www.youtube.com/watch?v=1vWbqf7cHLg');
