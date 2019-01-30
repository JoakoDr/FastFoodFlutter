import 'package:cloud_firestore/cloud_firestore.dart';

class Menu {
  final String name;
  final String calories;
  final String valoracion;
  final String imagen;
  final DocumentReference reference;

  Menu(this.name, this.calories, this.valoracion,this.imagen, this.reference);

  Menu.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : assert(map['Nombre'] != null),
        assert(map['Calorias'] != null),
        assert(map['Valoracion'] != null),
        assert(map['Imagen'] != null),
        this.name = map['Nombre'],
        this.calories = map['Calorias'],
        this.valoracion = map['Valoracion'],
        this.imagen = map['Imagen'];


  @override
  String toString() => "Menu<$name:$calories:$valoracion>";
}