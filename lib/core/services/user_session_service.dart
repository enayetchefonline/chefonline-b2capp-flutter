import 'package:hive/hive.dart';

class UserSessionManager {
  UserSessionManager._privateConstructor();
  static final UserSessionManager instance = UserSessionManager._privateConstructor();

  // Box name
  static const String _boxName = 'user_session';

  // Keys
  static const String _authTokenKey = 'authToken';
  static const String _userNameKey = 'userName';

  late final Box<dynamic> _box;

  /// Call once before using
  Future<void> initialize() async {
    _box = await Hive.openBox(_boxName);
  }

  // ---------------- USER SESSION ----------------
  Future<void> saveAuthToken(String token) async =>
      _box.put(_authTokenKey, token);

  String? getAuthToken() => _box.get(_authTokenKey);

  Future<void> clearAuthToken() async =>
      _box.delete(_authTokenKey);

  Future<void> saveUserName(String user) async =>
      _box.put(_userNameKey, user);

  String? getUserName() => _box.get(_userNameKey);

  Future<void> clearUserName() async =>
      _box.delete(_userNameKey);

  bool isLoggedIn() {
    final token = getAuthToken();
    return token != null && token.isNotEmpty;
  }

  // Future<void> saveDeviceId(String deviceId) async =>
  //     _box.put(_deviceRegister, deviceId);
  // String? getDeviceId() => _box.get(_deviceRegister);
  //
  // // ---------------- PRINTER SETTINGS ----------------
  // Future<void> savePrinterConfig({required String ip, required int port}) async {
  //   await _box.put(_printerIpKey, ip);
  //   await _box.put(_printerPortKey, port);
  // }
  //
  // String? getPrinterIp() => _box.get(_printerIpKey);
  //
  // int getPrinterPort() => _box.get(_printerPortKey, defaultValue: 9100);
  //
  // Future<void> savePrinterStatus(String status) async {
  //   await _box.put(_printerStatusKey, status);
  // }
  //
  // String getPrinterStatus() => _box.get(_printerStatusKey, defaultValue: 'Not Connected');
  //
  // Future<void> clearPrinterConfig() async {
  //   await _box.delete(_printerIpKey);
  //   await _box.delete(_printerPortKey);
  //   await _box.delete(_printerStatusKey);
  // }


  Future<void> logout() async {
    await _box.delete(_authTokenKey);
    await _box.delete(_userNameKey);

    print('Logged out successfully, session data removed.');

  }

}
