import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Hobi dan Minat',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: ListTile(
              leading: Icon(Icons.sports_esports),
              title: Text('Mobile Legends'),
              subtitle: Text(
                'Sekalian nyari cuan.',
              ),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.headphones),
              title: Text('Mendengarkan Musik'),
              subtitle: Text(
                'Ngevibes.',
              ),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Tech Reviewing'),
              subtitle: Text(
                'Suka ngulik kaya tools apapun yang terbaru gitu dari github.',
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('Sekolah Menengah Kejuruan'),
              subtitle: Text('SMKN 5 Kabupaten Tangerang'),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Perguruan Tinggi'),
              subtitle: Text(
                'Global Institute - Software Engineering',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
