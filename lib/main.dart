import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Profil Mahasiswa',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      home: ProfilePage(
        profile: Profile(
          nama: 'Dhani Kusuma Wardana Putra',
          nim: '1124160014',
          prodi: 'Software Engineering',
          kelas: 'Semester 5',
          bio: 'Mahasiswa global institute',
          email: 'dhanikusuma256@gmail.com',
          hp: '0895321813103',
          github: 'github.com/dhaniKWP',
        ),
      ),
    );
  }
}
