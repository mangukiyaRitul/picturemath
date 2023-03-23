import 'package:flutter/material.dart';
import 'home.dart';

void main()
{
  
  runApp(picture(),);
  
}
class picture extends StatefulWidget {
  const picture({Key? key}) : super(key: key);

  @override
  State<picture> createState() => _pictureState();
}

class _pictureState extends State<picture> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => home(),
      },
      debugShowCheckedModeBanner: false,
      home: home(),

    );
  }
}
