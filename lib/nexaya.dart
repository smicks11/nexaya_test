import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/app/app.router.dart';
import 'package:nexaya/core/service/local/local_service.dart';
import 'package:stacked_services/stacked_services.dart';

class Nexaya extends StatefulWidget {
  const Nexaya({
    Key? key,
  }) : super(key: key);

  @override
  State<Nexaya> createState() => _NexayaState();
}

class _NexayaState extends State<Nexaya> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    initializeState();
    super.initState();
  }

  initializeState() async {
    await ScreenUtil.ensureScreenSize();
    await setupLocator();
    await openHiveBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => child!,
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
        ),
      ),
    );
  }
}
