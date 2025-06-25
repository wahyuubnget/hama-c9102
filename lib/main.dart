import 'package:flutter/material.dart';
import 'package:ruangan_hama/screens/edit_ruangan.dart';
import 'package:ruangan_hama/screens/tambah_ruangan.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/daftar_ruangan.dart';

void main() {
  runApp(const BookingRuanganApp());
}

class BookingRuanganApp extends StatelessWidget {
  const BookingRuanganApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Booking Ruangan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
         '/daftar': (context) =>  DaftarRuangan(),
         '/tambah-ruangan': (context) =>  TambahRuangan(),
          '/edit-ruangan': (context) =>  EditRuangan(),
      },
    );
  }
}
