//Flutter application written by pratik mehkarkar
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),),
    );
  }

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage>  with SingleTickerProviderStateMixin
{
  AnimationController controller;
  Animation animation;
  Animation size_animation;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homework 4'),
      ),
      body: Row(
        children: [
          Container(
            height: size_animation.value,
            width: size_animation.value,
            color: animation.value,
            child: FlutterLogo(),
          ),
          Container(
            child: Column(
              children: [
                Icon(Icons.check_circle_outline,
                  size: 150,
                  color: Colors.blueAccent,)
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  void initState()
  {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation = ColorTween(begin: Colors.black12,end: Colors.yellow).
    animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    size_animation = Tween<double>(begin: 100.0,end: 200.0).animate(controller);
    controller.addListener(()
    {
      setState(() {});
    });
    controller.repeat();
  }
}


