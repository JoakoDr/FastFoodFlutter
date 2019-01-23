import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/main.dart';


class FastDetails extends StatefulWidget {
  Restaurant restaurant;
  FastDetails(this.restaurant);
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
              new Icon(Icons.home, size: 100.0,color: Colors.red,),
              new Text("Compañia: "+widget.restaurant.name),
              new Text("Tipo de Comida : "+widget.restaurant.food),
              new Text("Calorias: "+widget.restaurant.calories)
            ],
        )

            )
          ],
        ),
      ),
    );
  }




}
