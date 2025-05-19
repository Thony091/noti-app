
import 'package:mocktail/mocktail.dart';
import 'package:noti_app/features/news/domain/repositories/news_repository.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void registerFallbacks() {
  registerFallbackValue(const Duration(seconds: 1));
}
