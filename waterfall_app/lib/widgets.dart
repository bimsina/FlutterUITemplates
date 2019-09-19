import 'package:flutter/material.dart';
import 'package:waterfall_app/detailpage.dart';

import 'constants.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;

  RoundedButton({Key key, this.icon = Icons.arrow_back}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.white38),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;

  CustomButton({Key key, this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
    );
  }
}

class WaterFallList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            index: index,
                          )));
            },
            child: Column(
              children: <Widget>[
                Text(
                  'Waterfall $index',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover)),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            PriceWidget(),
            CustomButton(
              text: 'Pay For',
              color: Color(0xff196b81),
            )
          ],
        ));
  }
}

class PriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomOutlineButton(
          icon: Icons.add,
        ),
        Text(
          '\$1288',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        CustomOutlineButton(
          icon: Icons.add,
        ),
      ],
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final IconData icon;

  CustomOutlineButton({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ));
  }
}

class ParameterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SingleParameterWidget(
          title: '920',
          subtitle: 'Wide',
        ),
        SingleParameterWidget(
          title: '920',
          subtitle: 'Wide',
        ),
        SingleParameterWidget(
          title: '920',
          subtitle: 'Wide',
        )
      ],
    );
  }
}

class SingleParameterWidget extends StatelessWidget {
  final String title, subtitle;

  SingleParameterWidget({Key key, this.title, this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 16, color: Colors.black)),
            Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    ));
  }
}

class NumberSelector extends StatefulWidget {
  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selected = index;
            });
          },
          child: Container(
            width: 40,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              '$index',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: selected == index ? Colors.white : Colors.black),
            ),
            decoration: BoxDecoration(
                color: selected == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16.0)),
          ),
        );
      },
    );
  }
}
