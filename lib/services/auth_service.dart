import 'package:youapp_test_mobileapp/app/providers/api_provider.dart';

class AuthService {
  static Future<Map<String, dynamic>> login(
    String email,
    String username,
    String password,
  ) async {
    try {
      final response = await ApiProvider.client.post(
        '/login',
        data: {'email': email, 'username': username, 'password': password},
      );

      return response.data;
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  static Future<Map<String, dynamic>> register(
    String email,
    String username,
    String password,
  ) async {
    try {
      final response = await ApiProvider.client.post(
        '/register',
        data: {'email': email, 'username': username, 'password': password},
      );

      return response.data;
    } catch (e) {
      throw Exception('Register failed: ${e.toString()}');
    }
  }
}
