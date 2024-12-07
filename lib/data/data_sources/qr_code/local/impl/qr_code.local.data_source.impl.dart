import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:workerbase_scanner/core/interfaces/storage.interface.dart';
import 'package:workerbase_scanner/data/data_sources/qr_code/local/qr_code.local.data_source.dart';
import 'package:workerbase_scanner/data/storages/body/qr_code.body.dart';

/// [QrCodeLocalDataSourceImpl]
final class QrCodeLocalDataSourceImpl implements QrCodeLocalDataSource {
  final StorageInterface<Map<String, Object?>?> _storage;

  const QrCodeLocalDataSourceImpl({
    required StorageInterface<Map<String, Object?>?> storage,
  }) : _storage = storage;

  String get _qrCodes => 'qr_codes';

  @override
  Future<void> saveQrCode(QrCodeLocalModel qrCode) async {
    final Map<String, Object?> savedData =
        await _storage.get(_qrCodes) ?? <String, Object?>{};

    final List<QrCodeLocalModel> savedQrCodes = savedData.values
        .map(
          (dynamic json) =>
              QrCodeLocalModel.fromJson(jsonDecode(json as String)),
        )
        .toList();

    if (savedQrCodes
        .where((QrCodeLocalModel e) => e.qrCode == qrCode.qrCode)
        .isNotEmpty) {
      return;
    }

    return _storage.set(_qrCodes, jsonEncode(qrCode.toJson()));
  }

  @override
  Future<void> deleteQrCode(String qrCode) async {
    final Map<String, Object?> savedData =
        await _storage.get(_qrCodes) ?? <String, Object?>{};

    final List<QrCodeLocalModel> savedQrCodes = savedData.values
        .map(
          (dynamic json) =>
              QrCodeLocalModel.fromJson(jsonDecode(json as String)),
        )
        .toList();

    final QrCodeLocalModel? item = savedQrCodes
        .firstWhereOrNull((QrCodeLocalModel e) => e.qrCode == qrCode);

    if (item == null) return;

    return _storage.remove(_qrCodes, jsonEncode(item.toJson()));
  }

  @override
  Future<List<QrCodeLocalModel>> getQrCodes() async {
    final Map<String, Object?> savedData =
        await _storage.get(_qrCodes) ?? <String, Object?>{};

    if (savedData.isEmpty) return <QrCodeLocalModel>[];

    return savedData.values
        .map(
          (dynamic json) =>
              QrCodeLocalModel.fromJson(jsonDecode(json as String)),
        )
        .toList();
  }
}
