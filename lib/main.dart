import 'package:Airplay/ui/dashboard/nav_bar.dart';
import 'package:Airplay/ui/onboarding/splashscreen.dart';
import 'package:Airplay/utils/theme/config.dart';
import 'package:Airplay/utils/theme/custom_theme.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData(
      //   textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
      //   primaryColor: Colors.white,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),

      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: NavBar(), // SplashScreen(),
    );
  }
}
