import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(bool isDark) {
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  final Profile profile = Profile(
    nama: 'Dhani Kusuma Wardana Putra',
    nim: '1124160014',
    prodi: 'Software Engineering',
    kelas: 'TI24PSE3',
    bio: 'Mahasiswa yang tertarik dengan pemrograman.',
    email: 'dhanikusuma256@gmail.com',
    hp: '0895321813103',
    github: 'github.com/dhaniKWP',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8FF),
        cardColor: Colors.white,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF38BDF8),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        cardColor: const Color(0xFF1E293B),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => LoginPage(
          onThemeChanged: changeTheme,
          isDarkMode: themeMode == ThemeMode.dark,
        ),
        '/profile': (context) => ProfilePage(
          profile: profile,
          onThemeChanged: changeTheme,
          isDarkMode: themeMode == ThemeMode.dark,
        ),
      },
    );
  }
}
