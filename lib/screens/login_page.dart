import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _nimController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _nimController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (_nimController.text == '1124160014' &&
        _passwordController.text == 'global') {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            profile: Profile(
              nama: 'Dhani Kusuma Wardana Putra',
              nim: '1124160014',
              prodi: 'Software Engineering',
              kelas: 'TI24PSE3',
              bio: 'Mahasiswa yang tertarik dengan pemrograman.',
              email: 'dhanikusuma256@gmail.com',
              hp: '0895321813103',
              github: 'github.com/dhaniKWP',
            ),
          ),
        ),
      );

    } else {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('NIM atau password salah'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 100,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM harus diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password harus diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : login,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
