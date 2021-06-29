import 'package:flutter/material.dart';
import 'package:rubik_race/widgets/rubik.dart';

class Home extends StatefulWidget {

  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.white,
    Colors.blue,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Best time'),
                          Text('00:00:58'),
                          Text('Current time'),
                          Text('00:00:58'),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              color: Colors.black,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(40),
              child: AspectRatio(
                aspectRatio: 1,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Rubik(
                      size: 5,
                      width: constraints.maxWidth,
                      margin: 8,
                      colors: colors,
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              width: 200,
              height: 80,
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text("CHECK", style: TextStyle(fontSize: 24),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
