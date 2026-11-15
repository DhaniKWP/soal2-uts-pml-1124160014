import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'about_page.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;
  final ValueChanged<bool> onThemeChanged;
  final bool isDarkMode;

  const ProfilePage({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
    required this.profile,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profile;
  late bool isDarkMode;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;
    isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedIndex == 0
              ? 'Profil Mahasiswa'
              : selectedIndex == 1
              ? 'Tentang Saya'
              : 'Pengaturan',
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          profileContent(),
          const AboutPage(),
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Card(
                child: SwitchListTile(
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Aktifkan tampilan gelap'),
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                    widget.onThemeChanged(value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'Tentang',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      )
          : null,
    );
  }

  Widget profileContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/foto.jpg'),
          ),
          const SizedBox(height: 16),
          Text(
            profile.nama,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'NIM ${profile.nim}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${profile.prodi} • ${profile.kelas}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              profile.bio,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Informasi Kontak',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                InfoTile(
                  icon: Icons.email,
                  title: 'Email',
                  value: profile.email,
                ),
                InfoTile(
                  icon: Icons.phone,
                  title: 'Nomor HP',
                  value: profile.hp,
                ),
                InfoTile(
                  icon: Icons.code,
                  title: 'GitHub',
                  value: profile.github,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
