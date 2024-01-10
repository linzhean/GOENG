abstract class Entity {
  final String collectionName;

  const Entity({required this.collectionName});

  Map<String, dynamic> toMap();
}
