import 'package:hive/hive.dart';

abstract class AuthLocalDB {
  Future<void> saveSessionId(String sessionId);
  Future<String?> getSessionId();
  Future<void> deleteSessionId();
}

class AuthLocalDBImpl extends AuthLocalDB {
  @override
  Future<void> deleteSessionId() async {
    final box = await Hive.openBox('authBox');
    await box.delete('session_id');
  }

  @override
  Future<String?> getSessionId() async {
    final box = await Hive.openBox('authBox');
    final session = await box.get('session_id');
    return session;
  }

  @override
  Future<void> saveSessionId(String sessionId) async {
    final box = await Hive.openBox('authBox');
    await box.put('session_id', sessionId);
  }
}
