import 'package:hive/hive.dart';

typedef BoxInitialiser = void Function(Box);

late Box persistBox;
late Box authBox;

final boxInitializers = <String, BoxInitialiser>{
  'persistBox': (box) => persistBox = box,
  'authBox': (box) => authBox = box,
};