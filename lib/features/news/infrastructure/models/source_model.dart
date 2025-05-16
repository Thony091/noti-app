import 'package:hive/hive.dart';

part 'source_model.g.dart';

@HiveType(typeId: 0)
class SourceModel {
  
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;
  
  SourceModel({
      required this.id,
      required this.name,
  });
  
  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
      id: json["id"] ?? "" ,
      name: json["name"] ?? 'Sin Nombre',
  );
  
  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
  };
  
}
