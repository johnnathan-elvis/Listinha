import 'package:realm/realm.dart';

part 'configuration_model.g.dart';

@RealmModel()
class _configurationModel {
  late String themeModeName;
  late DateTime? syncDate;
}
