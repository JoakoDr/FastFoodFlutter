import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Models/Menu.dart';
import 'package:flutter_firebase/FastFoodDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_firebase/main.dart';


class InsertFood extends StatefulWidget {
  String name;
  dynamic menus = new List<dynamic>();
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
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
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

                    ListTile(

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
  Widget _buildListItem(BuildContext context, Menu menu) {

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
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: widget.menus.map<Widget>((menu) => _buildListItem(context, menu)).toList(),
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


  Widget imagePicker(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
