import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'custom_icons_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Color(0xff1F2432),
        primaryColor: Color(0xff51586B),
        accentColor: Color(0xffFF9C02),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark,
            ])),
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          children: <Widget>[
            _topRow(),
            _unitsWidget(context),
            Expanded(
              child: Image.asset('assets/sushi.png'),
            ),
            _ingredientsWidget(),
            _priceWidget(),
            _mapWidget(),
            _orderButton(context)
          ],
        ),
      ),
    );
  }

  Widget _priceWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '\$29',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          Text(
            '.99',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('VALUATIONS',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    Row(
                      children: <Widget>[
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SmoothStarRating(
                            starCount: 5,
                            rating: rating,
                            onRatingChanged: (newRating) {
                              setState(() {
                                rating = newRating;
                              });
                            },
                            size: 24.0,
                            spacing: 4.0,
                            color: Colors.green,
                            borderColor: Colors.green,
                          ),
                        ),
                        Text(
                          '(69)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _mapWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xff485066)),
              child: Icon(
                Icons.location_on,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'DELIVERY',
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '221b Baker Street , London',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '12:00 pm to 3:00 pm',
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _orderButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(width: 2, color: Theme.of(context).accentColor)),
      child: Text(
        'Make Order Now',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _ingredientsWidget() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(children: [
        _singleIngredient(CustomIcons.fish, 'Fish'),
        Icon(
          Icons.more_vert,
          color: Colors.white38,
        ),
        _singleIngredient(CustomIcons.caviar, 'Caviar'),
        Icon(
          Icons.more_vert,
          color: Colors.white38,
        ),
        _singleIngredient(CustomIcons.rice, 'Rice'),
      ]),
    );
  }

  Widget _singleIngredient(IconData icon, String title) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _unitsWidget(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: index == 0
                    ? Theme.of(context).accentColor
                    : Colors.transparent,
                border:
                    Border.all(color: Theme.of(context).accentColor, width: 2),
                borderRadius: BorderRadius.circular(16)),
            child: Text(
              '${index + 5} units',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  Widget _topRow() {
    return Row(
      children: <Widget>[
        Icon(Icons.arrow_back_ios, color: Colors.white),
        Expanded(
          child: Text(
            'Maki Salmon',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Icon(Icons.favorite, color: Colors.white)
      ],
    );
  }
}
