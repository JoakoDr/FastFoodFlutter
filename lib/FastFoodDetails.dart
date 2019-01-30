import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Models/Menu.dart';
import 'package:flutter_firebase/main.dart';


class FastDetails extends StatefulWidget {
  Menu menu;
  FastDetails(this.menu);
  @override
  _FastDetailsState createState() {
    return _FastDetailsState();
  }
}

class _FastDetailsState extends State<FastDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fast Food Restaurants')),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Card(
              child:
                  new Column(
            children: <Widget>[
              new Image.network(widget.menu.imagen),
              new Text("Nombre del Menu: ${widget.menu.name}"),
              new Text("Calorias :  ${widget.menu.calories}"),
              new Text("Valoracion:  ${widget.menu.valoracion}")
            ],
        )

            )
          ],
        ),
      ),
    );
  }




}
