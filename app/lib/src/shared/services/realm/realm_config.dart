import 'package:realm/realm.dart';

import 'models/configuration_model.dart';

LocalConfiguration config = Configuration.local(
  [
    configurationModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(configurationModel('system'));
  },
);
