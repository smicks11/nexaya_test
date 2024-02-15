import 'dart:async';
import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  
  init() {
    startTimer();
  }

  startTimer() {
    const duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    navigationService.replaceWithSignInView();
  }
}
