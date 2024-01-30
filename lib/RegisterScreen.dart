import 'package:aktivitas_1/main.dart';
import 'package:flutter/material.dart';
import 'package:aktivitas_1/widget/FieldCustom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController nbiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController instagramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/27.png',
                scale: 6,
              ),
              Text(
                'WELCOME',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20
                  )
                  ),
              Text(
                'Praktikum PAB 2023',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12
                  )
                  ),
              SizedBox(
                height: 5,
              ),
              textFieldCustom('Masukkan NBI', nbiController),
              textFieldCustom('Masukkan Nama', namaController),
              textFieldCustom('Masukkan Email', emailController),
              textFieldCustom('Masukkan Alamat', alamatController),
              textFieldCustom('Masukkan Akun Instagram', instagramController),
              
              Padding(
                padding: const EdgeInsets.only(left: 620, right: 620, top: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('nbi', nbiController.text);
                      await prefs.setString('nama', namaController.text);
                      await prefs.setString('email', emailController.text);
                      await prefs.setString('alamat', alamatController.text);
                      await prefs.setString('instagram', instagramController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (build) {
                            return MyHomePage();
                          },
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text("Daftar"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
