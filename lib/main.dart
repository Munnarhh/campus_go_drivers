import 'package:bot_toast/bot_toast.dart';
import 'package:campus_go_drivers/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/info_handler/app_info.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme.dart';
import 'features/onboarding/presentation/views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        //splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter On boarding',
            theme: theme(context),
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            //home: const Home(),
            initialRoute: SplashScreen.routeName,
            routes: routes,
          );
        },
      ),
    );
  }
}
