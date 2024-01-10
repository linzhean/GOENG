import 'package:goeng/entity/Entity.dart';


class WordSet extends Entity{
  int? id;
  String? name;
  String? createId;
  bool? available;

  WordSet({this.id, this.name, this.createId, this.available = true}) : super(collectionName: 'word_set');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createId': createId,
      'available': available
    };
  }

  factory WordSet.fromMap(Map<String, dynamic> map) {
    return WordSet(id: map['id'], name: map['name'], createId: map['createId'], available: map['available'])
      ..id = map['id'];
  }
}
