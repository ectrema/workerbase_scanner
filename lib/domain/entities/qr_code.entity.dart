import 'package:equatable/equatable.dart';
import 'package:workerbase_scanner/data/storages/body/qr_code.body.dart';

export 'extensions/qr_code.extension.dart';

final class QrCodeEntity with EquatableMixin {
  final String qrCode;

  final DateTime date;

  QrCodeEntity({
    required this.qrCode,
    required this.date,
  });

  factory QrCodeEntity.fromLocal(
    QrCodeLocalModel localModel,
  ) {
    return QrCodeEntity(
      qrCode: localModel.qrCode,
      date: DateTime.parse(localModel.date),
    );
  }

  @override
  List<Object?> get props => <Object?>[
        qrCode,
        date,
      ];
}
