
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/FastFoodDetails.dart';
import 'package:flutter_firebase/InsertFood.dart';
import 'package:flutter_firebase/Models/Menu.dart';
import 'package:flutter_firebase/auth.dart';
import 'package:flutter_firebase/logIn_SignUp.dart';
import 'package:flutter_firebase/main.dart';

class FoodMenuDetails extends StatefulWidget {
  dynamic menus = new List<dynamic>();
  String name;
  FoodMenuDetails(this.menus, this.name);
  Map menusB = new Map<String,dynamic>();
  @override
  _FoodMenuDetailsState createState() {
    return _FoodMenuDetailsState();
  }
}

class _FoodMenuDetailsState extends State<FoodMenuDetails> {

  BaseAuth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.name}',),
        backgroundColor: Colors.black,

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _insert();
            },
          )
        ],
      ),

      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('restaurants')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  void _insert() {
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InsertFood(widget.name)),
      );
    } catch (e) {
      print(e);
    }

  }


  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: widget.menus.map<Widget>((menu) => _buildListItem(context, menu)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Menu menu) {
    // ignore: argument_type_not_assignable

    // Map<dynamic,dynamic> menusList = new Map<dynamic,dynamic>.from(menus);

   // final menusBueno = Menu.fromMap(menusList);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: Image.network(menu.imagen, fit: BoxFit.cover ,height: 40.0,width: 40.0),
          title: Text(menu.name),
          trailing: Text(menu.valoracion),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FastDetails(menu)),
          ),
        ),
      ),
    );
  }
}