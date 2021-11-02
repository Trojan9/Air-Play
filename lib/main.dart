import 'package:Airplay/ui/onboarding/splashscreen.dart';
import 'package:flutter/material.dart';
// import 'package:Airplay/ui/onboarding/splash.dart';

// import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'core/storage/local_storage.dart';
// import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

//ValueNotifier<int> cartCount;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),

      home: const SplashScreen(),
      // home: HomeScreen(),
      // builder: (BuildContext context, Widget child) => Navigator(
      //     key: locator<DialogService>().dialogNavigationKey,
      //     onGenerateRoute: (RouteSettings settings) =>
      //         MaterialPageRoute<dynamic>(
      //             builder: (BuildContext context) =>
      //                 DialogManager(child: child))),
      // navigatorKey: locator<NavigationService>().navigationKey,
      // onGenerateRoute: generateRoute,
    );
  }
}
