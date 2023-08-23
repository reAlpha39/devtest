import 'package:flutter_dotenv/flutter_dotenv.dart';

class BuildConfig {
  final String baseUrl;

  const BuildConfig._({
    required this.baseUrl,
  });

  BuildConfig._dev()
      : this._(
          baseUrl: dotenv.env['BASE_URL'] ?? '',
        );

  static late BuildConfig _instance;

  static void init() {
    _instance = BuildConfig._dev();
  }

  static BuildConfig get() => _instance;
}
