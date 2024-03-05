// ignore_for_file: constant_identifier_names

enum Environment { dev, prod}

const String BASE_URL = "_baseurl";
const String FLAVOR = "_flavor";

class AppConfig {
  Map<String, dynamic> config;
  Environment env;
  AppConfig({required this.config, required this.env});

  get baseURL => config[BASE_URL] ?? "";
  get flavor => config[FLAVOR] ?? "";
}
