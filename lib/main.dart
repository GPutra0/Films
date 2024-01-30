//1462100186 Galieh widya putra 
import 'package:aktivitas_1/RegisterScreen.dart';
import 'package:aktivitas_1/SplashScreen.dart';
import 'package:aktivitas_1/pin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String? nbi;
  String? nama;

  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _nbi = prefs.getString('nbi');
    final String? _nama = prefs.getString('nama');

    setState(() {
      nbi = _nbi;
      nama = _nama;
    });
  }

  @override
  
  void initState() {
    super.initState();
    data();
  }

  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Welcome to',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
            ),
            Text(
              'PRAKTIKUM PAB 2023',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 30),
            Text(
              '$nbi',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
            ),
            SizedBox(height: 10),
            Image.network(
              'https://images-ext-2.discordapp.net/external/9EjBf8HaUUdwPqlS5bsInb16ca7kmhgLGilwNAPDm2Y/%3Fsize%3D626%26ext%3Djpg%26ga%3DGA1.1.210115498.1699974318%26semt%3Dsph/https/img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?width=701&height=701',
                width: 200.0,
                height: 300.0,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 25),
            Text(
              '$nama',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),
            ),
            
            SizedBox(height: 25),
            
            InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (build){
            return pinLock();
          },
          ),
          );
        },
        
        splashColor: Colors.green,
        child: Container(
          width: 200,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: Colors.greenAccent,
        ),
        child: Center(
          child: Text(
            'Masuk',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
          )
        ),
        ),
        
        SizedBox(
          height: 15,
        ),
            InkWell(
        onTap: () async{
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('nbi');
          await prefs.remove('nama');
          await prefs.remove('email');
          await prefs.remove('alamat');
          await prefs.remove('instagram');
          Navigator.push(context, MaterialPageRoute(
            builder: (build){
            return RegisterScreen();
          },
          ),
          );
        },
        
        splashColor: Colors.green,
        child: Container(
          width: 200,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: Color.fromARGB(255, 255, 0, 0),
        ),
        child: Center(
          child: Text(
            'Keluar',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
          )
        ),
        ),
        ],
        ),
      ),
    );
  }
}