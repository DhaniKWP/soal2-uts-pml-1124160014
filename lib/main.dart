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
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
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
