import 'package:aktivitas_1/RegisterScreen.dart';
import 'package:aktivitas_1/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? nbi = prefs.getString('nbi');
      final String? nama = prefs.getString('nama');
      final String? email = prefs.getString('email');
      final String? alamat = prefs.getString('alamat');
      final String? instagram = prefs.getString('instagram');

      if (nbi != null &&
          nama != null &&
          email != null &&
          alamat != null &&
          instagram != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (build) {
              return MyHomePage();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (build) {
              return RegisterScreen();
            },
          ),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFF3987B2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/29.png',
            scale: 3,
          ),
          SizedBox(height: 10),
          Text('PRAKTIKUM PAB 2023',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))
        ],
      ),
    ));
  }
}
