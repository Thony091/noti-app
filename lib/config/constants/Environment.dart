import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static Future<void> initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String get newsApiKey {
    final key = dotenv.env['NEWS_API_KEY'];
    if (key == null) {
      throw AssertionError('No se ha definido la API Key');
    }
    return key;
  } 
}