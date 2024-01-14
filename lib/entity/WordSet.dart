import 'package:goeng/entity/Entity.dart';

class WordSet extends Entity {
  int? id;
  String? name;
  String? createId;

  WordSet({this.id, this.name, this.createId})
      : super(collectionName: 'word_set');

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createId': createId,
    };
  }

  @override
  WordSet fromMap(Map<String, dynamic> map) {
    return WordSet(id: map['id'], name: map['name'], createId: map['createId'])
      ..id = map['id'];
  }
}
