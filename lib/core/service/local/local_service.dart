import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:nexaya/app/app.logger.dart';
import 'package:nexaya/core/payload/signin_payload.dart';
import 'package:nexaya/core/service/local/base_registry.dart';

abstract class LocalStorageService {
  LocalStorageService(this.box, String logString)
      : logger = getLogger(logString);

  final Box<dynamic> box;
  final Logger logger;

  Future<void> saveData(String key, dynamic value) async {
    logger.v('Saving data to local storage');
    await box.put(key, value);
  }

  dynamic getData(String key) {
    logger.v('Getting data from local storage');
    return box.get(key);
  }
}

Future<void> openHiveBoxes() async {
  final log = getLogger('openHiveBoxes');

  log.v('Opening Hive boxes');
  await Hive.initFlutter();
  Hive.registerAdapter(SignInPayloadAdapter());
  Hive.registerAdapter(DataAdapter());

  for (final box in boxInitializers.entries) {
    final boxName = box.key;
    log.v('Opening $boxName');

    final boxInitialiser = box.value;
    boxInitialiser(await Hive.openBox(boxName));
  }
}

Future<void> clearHiveBoxes() async {
  final log = getLogger('clearHiveBoxes');

  await Hive.deleteFromDisk();
  log.v('Hive boxes cleared');

  await openHiveBoxes();
}
