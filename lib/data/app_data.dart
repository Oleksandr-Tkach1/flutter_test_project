import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_project/data/models/api/response/TokenResponse.dart';

class AppData {
  AppData._privateConstructor();

  static final AppData _instance = AppData._privateConstructor();
  static AppData get instance => _instance;
  final _storage = const FlutterSecureStorage();

  void saveAccessToken(TokenResponse data) {
    _storage.write(key: 'ACCESS_TOKEN', value: data.token);
  }
  //
  void saveToken(String token) {
    _storage.write(key: 'ACCESS_TOKEN', value: token);
  }
  //
  Future<String?> getAccessToken() async {
    return _storage.read(key: 'ACCESS_TOKEN');
  }

  void clearAccessData() {
    _storage.write(key: 'ACCESS_TOKEN', value: '');
    _storage.write(key: 'USER_ID', value: '');
  }
}