class SourceModel {
    final dynamic id;
    final String name;

    SourceModel({
        required this.id,
        required this.name,
    });

    factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
