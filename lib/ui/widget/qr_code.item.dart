import 'package:flutter/material.dart';
import 'package:workerbase_scanner/domain/entities/qr_code.entity.dart';

class QrCodeItem extends StatelessWidget {
  const QrCodeItem({
    super.key,
    required this.qrCode,
    required this.onDelete,
    required this.onTap,
  });

  final QrCodeEntity qrCode;

  final VoidCallback onDelete;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3D3),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                qrCode.qrCode,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
