import 'package:flutter/material.dart';
import 'package:waterfall_app/widgets.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaterFall App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sans',
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff001D25),
        accentColor: Color(0xff196B81),
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(backGroundImage), fit: BoxFit.cover),
              ),
            ),
            _mainBody()
          ],
        ),
      ),
    );
  }

  Widget _mainBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black45,
      padding: const EdgeInsets.only(top: 80, left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi.',
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'bimsina',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Here is your waterfall paradise. Here are also some nature recommendations. Hope you enjoy your stay.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          WaterFallList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RoundedButton(),
              CustomButton(
                text: "Let's Go!",
                color: Color(0xff0cccdb),
              )
            ],
          )
        ],
      ),
    );
  }
}
