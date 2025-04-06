enum Environment {
  development,
  staging,
  production,
}

class AppConfig {
  static Environment environment = Environment.development;

  // API URLs for different environments
  static const Map<Environment, String> _apiBaseUrls = {
    Environment.development: 'https://ea7a-2a02-2f00-3000-ba00-acce-27f9-1f05-32be.ngrok-free.app',
    Environment.staging: 'https://staging-api.openreads.com',
    Environment.production: 'https://api.openreads.com',
  };

  // Get the current environment's API base URL
  static String get apiBaseUrl => _apiBaseUrls[environment]!;

  // App configuration
  static const String appName = 'Open Reads';
  static const String appVersion = '1.0.0';

  // Timeout values
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Initialize app configuration
  static void initialize({Environment env = Environment.development}) {
    environment = env;
  }
} 
