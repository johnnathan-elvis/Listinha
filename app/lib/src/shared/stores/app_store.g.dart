// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// RxGenerator
// **************************************************************************

class AppStore = _AppStore with _AppStoreMixin;

mixin _AppStoreMixin on _AppStore {
  ///
  /// GENERATED themeMode(ThemeMode)
  ///

  late final _themeModeRx = RxNotifier<ThemeMode>(super.themeMode);
  ValueListenable<ThemeMode> get themeModeListenable => _themeModeRx;

  @override
  set themeMode(ThemeMode _themeModeValue) =>
      _themeModeRx.value = _themeModeValue;
  @override
  ThemeMode get themeMode => _themeModeRx.value;

  ///
  /// GENERATED syscDate(DateTime?)
  ///

  late final _syscDateRx = RxNotifier<DateTime?>(super.syscDate);
  ValueListenable<DateTime?> get syscDateListenable => _syscDateRx;

  @override
  set syscDate(DateTime? _syscDateValue) => _syscDateRx.value = _syscDateValue;
  @override
  DateTime? get syscDate => _syscDateRx.value;
}
