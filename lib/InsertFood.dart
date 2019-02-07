import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Models/Menu.dart';
import 'package:flutter_firebase/main.dart';


class InsertFood extends StatefulWidget {
  String name;

  InsertFood(this.name);
  @override
  _InsertFoodState createState() {
    return _InsertFoodState();
  }
}

class _InsertFoodState extends State<InsertFood> {
  final name = TextEditingController();
  final valoration = TextEditingController();
  final calories = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.name}'), backgroundColor: Colors.black,),
      body: new Container(
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Card(
                child:
                new Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Please enter the menu name: ",
                      ),
                      controller: name,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Please enter the menu calories: ",
                      ),
                      controller: calories,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Please enter the menu valoration: ",
                      ),
                      controller: valoration,
                    ),
                  ],
                )

            ),

            ListTile(
              title: new Text("Add", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
              onTap: ()
              {

              },
            ),
            ListTile(
              title: new Text("Cancel", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
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
