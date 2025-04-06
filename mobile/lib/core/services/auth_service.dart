import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/core/constants/auth_config.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FlutterAppAuth _appAuth = const FlutterAppAuth();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _idTokenKey = 'id_token';

  Future<bool> login() async {
    try {
      debugPrint('Starting login process...');
      debugPrint('Discovery URL: ${AuthConfig.getDiscoveryUrl()}');
      debugPrint('Client ID: ${AuthConfig.clientId}');
      debugPrint('Redirect URL: ${AuthConfig.redirectUrl}');
      
      final AuthorizationTokenResponse? result =
          await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AuthConfig.clientId,
          AuthConfig.redirectUrl,
          discoveryUrl: AuthConfig.getDiscoveryUrl(),
          scopes: AuthConfig.scopes,
          preferEphemeralSession: false,
          promptValues: ['login'],
        ),
      );

      if (result != null) {
        debugPrint('Login successful, storing tokens...');
        await _secureStorage.write(
          key: _accessTokenKey,
          value: result.accessToken,
        );
        await _secureStorage.write(
          key: _refreshTokenKey,
          value: result.refreshToken,
        );
        await _secureStorage.write(
          key: _idTokenKey,
          value: result.idToken,
        );
        return true;
      }
      debugPrint('Login failed: No result received');
      return false;
    } catch (e, stackTrace) {
      debugPrint('Login error: $e');
      debugPrint('Stack trace: $stackTrace');
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final String? idToken = await _secureStorage.read(key: _idTokenKey);
      
      if (idToken != null) {
        await _appAuth.endSession(
          EndSessionRequest(
            idTokenHint: idToken,
            postLogoutRedirectUrl: AuthConfig.postLogoutRedirectUrl,
            discoveryUrl: AuthConfig.getDiscoveryUrl(),
          ),
        );
      }

      await _secureStorage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> refreshToken() async {
    try {
      final String? refreshToken =
          await _secureStorage.read(key: _refreshTokenKey);

      if (refreshToken == null) {
        return false;
      }

      final TokenResponse? result = await _appAuth.token(
        TokenRequest(
          AuthConfig.clientId,
          AuthConfig.redirectUrl,
          discoveryUrl: AuthConfig.getDiscoveryUrl(),
          refreshToken: refreshToken,
          grantType: 'refresh_token',
        ),
      );

      if (result != null) {
        await _secureStorage.write(
          key: _accessTokenKey,
          value: result.accessToken,
        );
        if (result.refreshToken != null) {
          await _secureStorage.write(
            key: _refreshTokenKey,
            value: result.refreshToken,
          );
        }
        if (result.idToken != null) {
          await _secureStorage.write(
            key: _idTokenKey,
            value: result.idToken,
          );
        }
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isAuthenticated() async {
    final String? accessToken = await _secureStorage.read(key: _accessTokenKey);
    return accessToken != null;
  }

  Future<String?> getAccessToken() async {
    return _secureStorage.read(key: _accessTokenKey);
  }
} 