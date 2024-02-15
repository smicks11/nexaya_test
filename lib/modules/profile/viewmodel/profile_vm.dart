// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/core/payload/signin_payload.dart';
import 'package:nexaya/core/service/local/persistent_storage_service.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.logger.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger("ProfileViewModel");
  BuildContext context;
  ProfileViewModel(this.context);

  final persistentStorageService = locator<PersistentStorageService>();

  SignInPayload? _signInPayload;
  SignInPayload? get signInPayload => _signInPayload;

  initializaData(){
    _signInPayload = persistentStorageService.getCoupleInfo;
    notifyListeners();
  }

}
