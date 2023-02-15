// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class configurationModel extends _configurationModel
    with RealmEntity, RealmObjectBase, RealmObject {
  configurationModel(
    String themeModeName, {
    DateTime? syncDate,
  }) {
    RealmObjectBase.set(this, 'themeModeName', themeModeName);
    RealmObjectBase.set(this, 'syncDate', syncDate);
  }

  configurationModel._();

  @override
  String get themeModeName =>
      RealmObjectBase.get<String>(this, 'themeModeName') as String;
  @override
  set themeModeName(String value) =>
      RealmObjectBase.set(this, 'themeModeName', value);

  @override
  DateTime? get syncDate =>
      RealmObjectBase.get<DateTime>(this, 'syncDate') as DateTime?;
  @override
  set syncDate(DateTime? value) => RealmObjectBase.set(this, 'syncDate', value);

  @override
  Stream<RealmObjectChanges<configurationModel>> get changes =>
      RealmObjectBase.getChanges<configurationModel>(this);

  @override
  configurationModel freeze() =>
      RealmObjectBase.freezeObject<configurationModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(configurationModel._);
    return const SchemaObject(
        ObjectType.realmObject, configurationModel, 'configurationModel', [
      SchemaProperty('themeModeName', RealmPropertyType.string),
      SchemaProperty('syncDate', RealmPropertyType.timestamp, optional: true),
    ]);
  }
}
