import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ConfigurationServices {
  void init();
  void deleteAll();
}

class ConfigurationServicesImp implements ConfigurationServices, Disposable {
  final Realm realm;
  final AppStore appStore;
  late final RxDisposer disposer;

  ConfigurationServicesImp(this.realm, this.appStore);

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }

  @override
  void init() {
    final model = _getconfiguration();
    appStore.themeMode = _getThemeModeByName(model.themeModeName);
    appStore.syscDate = model.syncDate;

    disposer = rxObserver(() {
      final themeMode = appStore.themeMode;
      final syncDate = appStore.syscDate;

      _saveConfiguration(themeMode.name, syncDate);
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  @override
  void dispose() {
    disposer();
  }

  configurationModel _getconfiguration() {
    return realm.all<configurationModel>().first;
  }

  @override
  void _saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = _getconfiguration();
    realm.write(() {
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }
}
