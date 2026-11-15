import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController bioController;
  late TextEditingController emailController;
  late TextEditingController hpController;
  late TextEditingController githubController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.profile.nama,
    );
    bioController = TextEditingController(
      text: widget.profile.bio,
    );
    emailController = TextEditingController(
      text: widget.profile.email,
    );
    hpController = TextEditingController(
      text: widget.profile.hp,
    );
    githubController = TextEditingController(
      text: widget.profile.github,
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    bioController.dispose();
    emailController.dispose();
    hpController.dispose();
    githubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Center(
              child: Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                'Perbarui informasi profil kamu',
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 24),

            TextFormField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: bioController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Bio',
                prefixIcon: Icon(Icons.edit_note),
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: hpController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor HP',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: githubController,
              decoration: const InputDecoration(
                labelText: 'GitHub',
                prefixIcon: Icon(Icons.code),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan Perubahan'),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
