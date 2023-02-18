import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

import 'models/configuration_model.dart';

LocalConfiguration config = Configuration.local(
  [
    configurationModel.schema,
    Task.schema,
    TaskBoard.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(configurationModel('system'));
  },
);
