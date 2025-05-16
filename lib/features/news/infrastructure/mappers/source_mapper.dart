
import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/infrastructure/models/models_container.dart';

class SourceMapper {
  static Source fromModel(SourceModel model) => Source(
    id: model.id,
    name: model.name,
  );

  static SourceModel toModel(Source entity) => SourceModel(
    id: entity.id,
    name: entity.name,
  );
}