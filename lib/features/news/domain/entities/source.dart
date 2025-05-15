part of 'article.dart';

class Source extends Equatable {
  
  final String id;
  final String name;
  
  const Source({
      required this.id,
      required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
      id: json["id"] ?? "Sin id" ,
      name: json["name"] ?? "Sin nombre",
  );
  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
  };
  
  @override
  List<Object?> get props => [id, name];
}
