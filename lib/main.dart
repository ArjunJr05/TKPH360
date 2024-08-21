import 'package:TKPH360/shoppage.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
=======
import 'package:TKPH360/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
>>>>>>> 5f334ce398b6da5dec660e7f7cbe471fb759799e
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
<<<<<<< HEAD

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('pausing..');
    await Future.delayed(const Duration(seconds: 3));
    print('unpausing..');
    FlutterNativeSplash.remove();
  }

=======
  
>>>>>>> 5f334ce398b6da5dec660e7f7cbe471fb759799e
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JournX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
<<<<<<< HEAD
      home: const HomePage(),
=======
      home: SplashScreen(),
>>>>>>> 5f334ce398b6da5dec660e7f7cbe471fb759799e
    );
  }
}

<<<<<<< HEAD
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
=======

>>>>>>> 5f334ce398b6da5dec660e7f7cbe471fb759799e
