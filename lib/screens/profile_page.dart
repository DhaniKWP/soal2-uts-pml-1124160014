import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  const ProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profile;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/images/foto.jpg'),
            ),

            const SizedBox(height: 16),

            Text(
              profile.nama,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 5),

            Text(
              profile.nim,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.school),
                    title: const Text('Program Studi'),
                    subtitle: Text(profile.prodi),
                  ),

                  ListTile(
                    leading: const Icon(Icons.class_),
                    title: const Text('Kelas'),
                    subtitle: Text(profile.kelas),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bio Singkat',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(profile.bio),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
