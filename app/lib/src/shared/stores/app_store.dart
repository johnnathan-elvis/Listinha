import 'package:flutter/material.dart';

import '../../configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syscDate = ValueNotifier<DateTime?>(null);

  final ConfigurationServices _configurationServices;

  AppStore(this._configurationServices) {
    init();
  }

  void init() {
    final model = _configurationServices.getconfiguration();
    syscDate.value = model.syncDate;
    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  void save() {
    _configurationServices.saveConfiguration(
      themeMode.value.name,
      syscDate.value,
    );
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
    }
  }

  void setSyncDate(DateTime date) {
    save();
  }

  void deleteApp() {
    _configurationServices.deleteAll();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
