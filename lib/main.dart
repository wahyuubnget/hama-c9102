import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_page.dart';
import 'admin_home.dart';
import 'user_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (kIsWeb) {
      // Konfigurasi Firebase untuk Web
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDyoJSScrn9qTQJBsRCrNJS0ZodF0cyZ-c",
          authDomain: "hama-c9102.firebaseapp.com",
          projectId: "hama-c9102",
          storageBucket: "hama-c9102.firebasestorage.app",
          messagingSenderId: "755423090844",
          appId: "1:755423090844:web:afc27ef7bb9f8e25543559",
          measurementId: "G-65CC9H8T2J",
        ),
      );
    } else {
      // Android/iOS
      await Firebase.initializeApp();
    }

    runApp(const MyApp());
  } catch (e) {
    print('Firebase init error: $e');
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Gagal inisialisasi Firebase: $e')),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Hama',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/admin': (context) => const AdminHome(),
        '/user': (context) => const UserHome(),
      },
    );
  }
}
