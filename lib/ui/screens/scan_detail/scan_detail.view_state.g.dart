// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_detail.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScanDetailStateCWProxy {
  ScanDetailState qrCode(QrCodeEntity? qrCode);

  ScanDetailState isLink(bool isLink);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScanDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScanDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  ScanDetailState call({
    QrCodeEntity? qrCode,
    bool isLink,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScanDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScanDetailState.copyWith.fieldName(...)`
class _$ScanDetailStateCWProxyImpl implements _$ScanDetailStateCWProxy {
  const _$ScanDetailStateCWProxyImpl(this._value);

  final ScanDetailState _value;

  @override
  ScanDetailState qrCode(QrCodeEntity? qrCode) => this(qrCode: qrCode);

  @override
  ScanDetailState isLink(bool isLink) => this(isLink: isLink);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScanDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScanDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  ScanDetailState call({
    Object? qrCode = const $CopyWithPlaceholder(),
    Object? isLink = const $CopyWithPlaceholder(),
  }) {
    return ScanDetailState(
      qrCode: qrCode == const $CopyWithPlaceholder()
          ? _value.qrCode
          // ignore: cast_nullable_to_non_nullable
          : qrCode as QrCodeEntity?,
      isLink: isLink == const $CopyWithPlaceholder()
          ? _value.isLink
          // ignore: cast_nullable_to_non_nullable
          : isLink as bool,
    );
  }
}

extension $ScanDetailStateCopyWith on ScanDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfScanDetailState.copyWith(...)` or like so:`instanceOfScanDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScanDetailStateCWProxy get copyWith => _$ScanDetailStateCWProxyImpl(this);
}
