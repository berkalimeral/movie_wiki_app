import 'package:hive/hive.dart';

abstract class AuthLocalDB {
  Future<void> saveSessionId(String sessionId);
  Future<void> getSessionId();
  Future<void> deleteSessionId(String sessionId);
}

class AuthLocalDBImpl extends AuthLocalDB {
  @override
  Future<void> deleteSessionId(String sessionId) async {
    final box = await Hive.openBox('authBox');
    await box.delete('session_id');
  }

  @override
  Future<void> getSessionId() async {
    final box = await Hive.openBox('authBox');
    await box.get('session_id');
  }

  @override
  Future<void> saveSessionId(String sessionId) async {
    final box = await Hive.openBox('authBox');
    await box.put('session_id', sessionId);
  }
}
