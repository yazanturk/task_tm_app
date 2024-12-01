import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

abstract class CacheHelper {
  Future<T?> getDataById<T>(int id, String boxName);
  Future<void> putData<T>(T object, String boxName);
  Future<void> clearData<T>(String boxName);
  Future<void> closeBox<T>(String boxName);
}

@LazySingleton(as: CacheHelper)
class HiveCacheHelper implements CacheHelper {
  @override
  Future<T?> getDataById<T>(int id, String boxName) async {
    try {
      Box<T>? i;
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox<T>(boxName);
      }
      i = Hive.box<T>(boxName);
      return i.get(id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> putData<T>(T object, String boxName) async {
    try {
      Box<T>? i;
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox<T>(boxName);
      }
      i = Hive.box<T>(boxName);
      await i.put(0, object);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<bool> clearData<T>(String boxName) async {
    try {
      Box<T>? i;
      // if (!Hive.isBoxOpen(boxName)) {
      //   // await Hive.openBox<T>(boxName);
      // }
      i = Hive.box<T>(boxName);
      await i.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> closeBox<T>(String boxName) {
    return Hive.box(boxName).close();
  }
}
