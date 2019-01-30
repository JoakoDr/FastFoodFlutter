import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/FastFoodDetails.dart';
import 'package:flutter_firebase/FoodMenuDetails.dart';
import 'package:flutter_firebase/Models/Restaurant.dart';
import 'package:flutter_firebase/auth.dart';
import 'package:flutter_firebase/logIn_SignUp.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Food',
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  BaseAuth auth = Auth();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Fast Food Restaurants')
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Image(
                  image: AssetImage("assets/A.JPG"),
                  color: Colors.white,
                )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: ()
              {
                //  _launchURL();



              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit"),
              onTap: ()
              {
                //  _launchURL();



              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Log Out"),
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
      stream: Firestore.instance.collection('restaurants').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    // ignore: argument_type_not_assignable
    final restaurant = Restaurant.fromSnapshot(data);


    return Padding(
      key: ValueKey(restaurant.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: Image.network(restaurant.image, fit: BoxFit.cover ,height: 40.0,width: 40.0),
          title: Text(restaurant.name),
          trailing: Text(restaurant.food),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodMenuDetails(restaurant.menus)),
          ),
        ),
      ),
    );
  }
}


