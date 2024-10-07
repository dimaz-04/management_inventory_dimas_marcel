import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Fungsi untuk menampilkan pesan error
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error', style: TextStyle(fontFamily: 'Poppins')),
        content: Text(message, style: TextStyle(fontFamily: 'Poppins')),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK', style: TextStyle(fontFamily: 'Poppins')),
          ),
        ],
      ),
    );
  }

  void _register(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Validasi apakah kolom email, password dan konfirmasi password sudah terisi
    if (email.isEmpty) {
      _showErrorDialog(context, "Email harus diisi.");
      return;
    }
    if (password.isEmpty) {
      _showErrorDialog(context, "Password harus diisi.");
      return;
    }
    if (confirmPassword.isEmpty) {
      _showErrorDialog(context, "Konfirmasi password harus diisi.");
      return;
    }
    if (password != confirmPassword) {
      _showErrorDialog(context, "Password dan konfirmasi password tidak cocok.");
      return;
    }

    // Jika validasi lolos, lanjutkan proses registrasi (misalnya, panggil API)
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registrasi", style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'images/keeptrack_nobg.png', // Ganti dengan gambar keeptrack_nobg.png
                  height: 180,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Buat Akun Baru",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "Masukkan detail untuk membuat akun",
                style: TextStyle(fontSize: 16, color: Colors.grey[600], fontFamily: 'Poppins'),
              ),
              SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: "Konfirmasi Password",
                  labelStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.blueAccent),
                ),
                obscureText: true,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _register(context); // Panggil fungsi register dengan validasi
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    "Daftar",
                    style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: 'Poppins'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sudah punya akun? Login",
                    style: TextStyle(color: Colors.blueAccent, fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
