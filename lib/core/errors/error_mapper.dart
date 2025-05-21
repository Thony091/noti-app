import 'package:noti_app/core/errors/error_container.dart';

class ErrorMapper {
  static Failure map(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else {
      return ServerFailure('Error desconocido');
    }
  }
}