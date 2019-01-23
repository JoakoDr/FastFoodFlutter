import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FastFoodDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food',
      home: FastDetails(),
    );
  }
}
class FastDetails extends StatefulWidget {
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
      body: _buildBody(context),
    );
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
          title: Text(restaurant.name),
          trailing: Text(restaurant.calories),
          onTap: () => print(restaurant)
        ),
      ),
    );
  }
}

class Restaurant {
  final String name;
  final String calories;
  final DocumentReference reference;

  Restaurant.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Nombre'] != null),
        assert(map['Calorias'] != null),
        name = map['Nombre'],
        calories = map['Calorias'];

  Restaurant.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Restaurante<$name:$calories>";
}