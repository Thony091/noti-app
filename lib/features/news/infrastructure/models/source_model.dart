class SourceModel {
    final String id;
    final String name;

    SourceModel({
        required this.id,
        required this.name,
    });

    factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"] ?? "Sin id" ,
        name: json["name"] ?? 'Sin Nombre',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
