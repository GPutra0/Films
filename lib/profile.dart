import 'package:aktivitas_1/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class profile extends StatefulWidget {
  const profile({super.key});
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Future<void> launchLink(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  String? nbi;
  String? nama;
  String? email;
  String? alamat;
  String? instagram;

  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _nbi = prefs.getString('nbi');
    final String? _nama = prefs.getString('nama');
    final String? _email = prefs.getString('email');
    final String? _alamat = prefs.getString('alamat');
    final String? _instagram = prefs.getString('instagram');

    setState(() {
      nbi = _nbi;
      nama = _nama;
      email = _email;
      alamat = _alamat;
      instagram = _instagram;
    });
  }

  @override
  void initState() {
    super.initState();
    data();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  title: Text(
                    "$nama",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.grid_3x3,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  title: Text(
                    "$nbi",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.markunread,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  title: Text(
                    "$email",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.house,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  title: Text(
                    "$alamat",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                    leading: Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    title: Text(
                      "$instagram",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onTap: () {
                      launchLink(
                          'https://instagram.com/gputraaaaaa?igshid=MmVlMjlkMTBhMg==',
                          isNewTab: true);
                    }),
                  SizedBox(height: 20),
                  ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  title: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (build) {
                          return MyHomePage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}