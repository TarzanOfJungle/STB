import 'package:hive/hive.dart';

abstract class HiveUtils {
  static Future<void> doInBoxScope<T>({
    required String boxKey,
    required Future<void> Function(Box<T> box) boxScope,
  }) async {
    final box = await Hive.openBox<T>(boxKey);
    await boxScope(box);
    await box.close();
  }
}
