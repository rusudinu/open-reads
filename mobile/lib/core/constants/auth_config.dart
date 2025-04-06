import 'package:mobile/core/constants/app_config.dart';

class AuthConfig {
  static const String clientId = 'open-reads';
  static const String redirectUrl = 'com.openreads.app://oauth/callback';
  static const String postLogoutRedirectUrl = 'com.openreads.app://';
  
  static const Map<String, String> discoveryUrls = {
    'development': 'http://378c-2a02-2f00-3000-ba00-acce-27f9-1f05-32be.ngrok-free.app/realms/open-reads/.well-known/openid-configuration',
    'staging': 'https://auth-staging.openreads.com/realms/open-reads/.well-known/openid-configuration',
    'production': 'https://auth.openreads.com/realms/open-reads/.well-known/openid-configuration',
  };

  static String getDiscoveryUrl() {
    final environment = AppConfig.environment.toString().split('.').last;
    return discoveryUrls[environment] ?? discoveryUrls['development']!;
  }

  // Scopes required for the application
  static const List<String> scopes = <String>[
    'openid',
    'profile',
    'email',
    'offline_access',
  ];
} 
