import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/Models/Menu.dart';

class Restaurant {
  final String name;
  final String food;
  final String image;
  List menus = List<Menu>();
  final DocumentReference reference;

  Restaurant.fromMap(Map<String, dynamic>map, {this.reference})
      :   assert(map['Nombre'] != null),
        assert(map['Comida'] != null),
        assert(map['Imagen'] != null),
       // assert(map['Menus'] != null),
        this.name = map['Nombre'],
        this.food = map['Comida'],
        this.image = map['Imagen'],
        //this.menus = map['Menus'];
        this.menus = map['Menus'].map((json) => Menu.fromMap(json)).toList();



  Restaurant.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Restaurante<$name:$food>";
}
