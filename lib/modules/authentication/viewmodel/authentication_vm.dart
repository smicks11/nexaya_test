// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/app/app.router.dart';
import 'package:nexaya/core/constants/constant.dart';
import 'package:nexaya/core/service/local/persistent_storage_service.dart';
import 'package:nexaya/core/service/remote/suthentication_service.dart';
import 'package:nexaya/shared/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.logger.dart';

class AuthenticationViewModel extends BaseViewModel {
  final log = getLogger("AuthenticationViewModel");
  BuildContext context;
  AuthenticationViewModel(this.context);

  final auth = locator<AuthenticationService>();
  final persistentStorageService = locator<PersistentStorageService>();
  final navigationService = locator<NavigationService>();

  final signInFormKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool _obsure = false;
  bool get obsure => _obsure;

  void switchObcure() {
    _obsure = !_obsure;
    notifyListeners();
  }
  
  Future<void> signIn() async {
    setBusy(true);
    try {
      Map<String, dynamic> data = {
        "email": emailCtrl.text,
        "password": passwordCtrl.text
      };
      final res = await auth.signInService(data);
      if (res.status == true) {
        //caching response data to local DB
        persistentStorageService.saveUserProfile(res.data!);
        navigationService.navigateToProfileView();
      } else {
        Alert.show(context, message: res.message ?? 'Unable to sign in at the moment', error: true);
      }
      setBusy(false);
    } on SocketException catch (e) {
      Alert.show(context, message: ErrorStatus.no_internet, error: true);
      log.d(e.toString());
      setBusy(false);
    } catch (e) {
      Alert.show(context, message: ErrorStatus.codeError, error: true);
      log.d('error on catch block: ${e.toString()}');
      setBusy(false);
    }
  }
}
