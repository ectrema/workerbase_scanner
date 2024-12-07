// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HistoryStateCWProxy {
  HistoryState savedQrCodes(List<QrCodeEntity> savedQrCodes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HistoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HistoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  HistoryState call({
    List<QrCodeEntity> savedQrCodes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHistoryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHistoryState.copyWith.fieldName(...)`
class _$HistoryStateCWProxyImpl implements _$HistoryStateCWProxy {
  const _$HistoryStateCWProxyImpl(this._value);

  final HistoryState _value;

  @override
  HistoryState savedQrCodes(List<QrCodeEntity> savedQrCodes) =>
      this(savedQrCodes: savedQrCodes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HistoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HistoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  HistoryState call({
    Object? savedQrCodes = const $CopyWithPlaceholder(),
  }) {
    return HistoryState(
      savedQrCodes: savedQrCodes == const $CopyWithPlaceholder()
          ? _value.savedQrCodes
          // ignore: cast_nullable_to_non_nullable
          : savedQrCodes as List<QrCodeEntity>,
    );
  }
}

extension $HistoryStateCopyWith on HistoryState {
  /// Returns a callable class that can be used as follows: `instanceOfHistoryState.copyWith(...)` or like so:`instanceOfHistoryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HistoryStateCWProxy get copyWith => _$HistoryStateCWProxyImpl(this);
}
