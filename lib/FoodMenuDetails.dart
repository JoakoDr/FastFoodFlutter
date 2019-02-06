
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/FastFoodDetails.dart';
import 'package:flutter_firebase/Models/Menu.dart';
import 'package:flutter_firebase/auth.dart';
import 'package:flutter_firebase/logIn_SignUp.dart';
import 'package:flutter_firebase/main.dart';

class FoodMenuDetails extends StatefulWidget {
  dynamic menus = new List<dynamic>();

  FoodMenuDetails(this.menus);
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
      appBar: AppBar(title: Text('Fast Food Restaurants',),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Image(
                  image: AssetImage("assets/logo.png"),
                )
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.black,
              ),
              title: Text("Home", style: TextStyle(fontSize: 25),),
              onTap: ()
              {
                _home();
              },
            ),
            ListTile(
              leading: Icon(Icons.edit,
                color: Colors.black,),
              title: Text("Edit", style: TextStyle(fontSize: 25),),
              onTap: ()
              {
                //  _launchURL();



              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new,
                color: Colors.black,),
              title: Text("Log Out", style: TextStyle(fontSize: 25),),
              onTap: ()
              {
                _signOut();

              },
            )
          ],
        ),
      ),
      body: _buildBody(context),
    );
  }

  void _home() async {
    try {
      await auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } catch (e) {
      print(e);
    }

  }

  void _signOut() async {
    try {
      await auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print(e);
    }

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