part of 'article.dart';

class Source extends Equatable {
  
  final dynamic id;
  final String name;
  
  const Source({
      required this.id,
      required this.name,
  });
  factory Source.fromJson(Map<String, dynamic> json) => Source(
      id: json["id"],
      name: json["name"],
  );
  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
  };
  
  @override
  List<Object?> get props => [id, name];
}
