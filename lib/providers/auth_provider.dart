import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  String? token;
  String? userName;
  final ApiService apiService = ApiService();
  final storage = const FlutterSecureStorage();

  AuthProvider() {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    token = await storage.read(key: 'token');
    if (token != null && token!.isNotEmpty) {
      isAuthenticated = true;
      try {
        final user = await apiService.getUser(token!);
        userName = user['name'];
      } catch (e) {
        isAuthenticated = false;
        token = null;
      }
    }
    notifyListeners();
  }

  Future<void> register(String name, String email, String password,
      String passwordConfirmation, String deviceName) async {
    final response = await apiService.register(
        name, email, password, passwordConfirmation, deviceName);

    token = response['token'];
    await storage.write(key: 'token', value: token);
    isAuthenticated = true;
    await checkAuthStatus();
    notifyListeners();
  }

  Future<void> login(String email, String password, String deviceName) async {
    final response = await apiService.login(email, password, deviceName);

    token = response['token'];
    await storage.write(key: 'token', value: token);
    isAuthenticated = true;
    await checkAuthStatus();
    notifyListeners();
  }

  Future<void> logout() async {
    token = null;
    userName = null;
    isAuthenticated = false;
    await storage.delete(key: 'token');
    notifyListeners();
  }
}