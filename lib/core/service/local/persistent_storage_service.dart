import 'package:nexaya/core/payload/signin_payload.dart';
import 'package:nexaya/core/service/local/base_registry.dart';
import 'package:nexaya/core/service/local/local_service.dart';

class LocalKeys {
  static const String userProfile = 'userProfile';
}

class PersistentStorageService extends LocalStorageService {
  PersistentStorageService() : super(persistBox, 'PersistentStorageService');

  void saveUserProfile(SignInPayload value) =>
      saveData(LocalKeys.userProfile, value);
  SignInPayload get getCoupleInfo => getData(LocalKeys.userProfile);
}
