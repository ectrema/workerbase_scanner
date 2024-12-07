import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:workerbase_scanner/core/interfaces/storage.interface.dart';

final class QrCodeStorage implements StorageInterface<Map<String, Object?>?> {
  final Database _database;
  final StoreRef<String, Map<String, Object?>> _store;

  static String get _installationPath => r'qr_code_local_storage.db';

  QrCodeStorage._(this._database, this._store);

  /// Static method to create a new instance of [QrCodeStorage]
  static Future<QrCodeStorage> inject() async {
    final Directory dir = await getApplicationDocumentsDirectory();

    await dir.create(recursive: true);

    final String dbPath = join(dir.path, _installationPath);

    final Database db = await databaseFactoryIo.openDatabase(dbPath);

    return QrCodeStorage._(db, StoreRef<String, Map<String, String>>.main());
  }

  @override
  Future<Map<String, Object?>?> get(String key) async =>
      _store.record(key).get(_database);

  @override
  Future<void> deleteAll() => _store.drop(_database);

  @override
  Future<bool> contains(String key) async =>
      _store.record(key).exists(_database);

  @override
  Future<void> remove(String key, String value) async {
    final Map<String, Object?> savedData =
        await get(key) ?? <String, Object?>{};

    final Map<String, Object?> map = <String, Object?>{
      ...savedData,
    }..removeWhere(
        (String savedKey, Object? savedValue) => savedValue == value,
      );
    await _store.record(key).put(_database, map);
  }

  @override
  Future<void> set(String key, String value) async {
    final Map<String, Object?> savedData =
        await get(key) ?? <String, Object?>{};

    final Map<String, Object?> map = <String, Object?>{
      ...savedData,
      savedData.length.toString(): value,
    };
    await _store.record(key).put(_database, map);
  }
}
