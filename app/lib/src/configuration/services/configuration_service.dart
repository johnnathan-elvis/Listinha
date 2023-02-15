import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

abstract class ConfigurationServices {
  configurationModel getconfiguration();
  void saveConfiguration(String themeModeName, DateTime? syncDate);
  void deleteAll();
}

class ConfigurationServicesImp implements ConfigurationServices {
  final Realm realm;

  ConfigurationServicesImp(this.realm);

  @override
  configurationModel getconfiguration() {
    return realm.all<configurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getconfiguration();
    realm.write(() {
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }
}
