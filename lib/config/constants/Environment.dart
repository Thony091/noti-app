import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String newsApiKey = dotenv.env['NEWS_API_KEY'] ?? 'No hay key';
}