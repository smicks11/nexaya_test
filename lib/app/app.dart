import 'package:nexaya/core/service/base/api_service.dart';
import 'package:nexaya/core/service/local/persistent_storage_service.dart';
import 'package:nexaya/core/service/remote/suthentication_service.dart';
import 'package:nexaya/modules/authentication/sign_in.dart';
import 'package:nexaya/modules/profile/profile.dart';
import 'package:nexaya/modules/splash/splash.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: SignInView),
    AdaptiveRoute(page: ProfileView),
    
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: PersistentStorageService),
  ],
  logger: StackedLogger(),
)
class App {}
