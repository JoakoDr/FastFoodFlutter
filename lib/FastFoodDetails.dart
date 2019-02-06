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
      appBar: AppBar(title: Text('${widget.menu.name}'), backgroundColor: Colors.black,),
      body: new Container(
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Card(
              child:
                  new Column(
            children: <Widget>[
              new Image.network(widget.menu.imagen, height: 400,),

            ],
                   )

            ),

            ListTile(
              title: new Text("Calorías :  ${widget.menu.calories}", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
              onTap: ()
              {
              },
            ),
            ListTile(
              title: new Text("Valoracion:  ${widget.menu.valoracion}", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
              onTap: ()
              {
              },
            ),
          ],
        ),
      ),
    );
  }




}
