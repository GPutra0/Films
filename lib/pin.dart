import 'package:aktivitas_1/BottomNavigationBar.dart';
import 'package:flutter/material.dart';

class pinLock extends StatefulWidget {
  pinLock({super.key});

  @override
  State<pinLock> createState() => _pinLockState();
}

class _pinLockState extends State<pinLock> {
  String pin = '2023';
  String inputvalue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'Enter Your PIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              SizedBox(height: 10),
              Text(
                'Please Enter Your PIN That You Have Created',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Icon(
                Icons.lock_outline,
                color: Colors.red,
                size: 50,
              ),
              SizedBox(height: 25),
              Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 1.5,
                    )),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      inputvalue = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 2.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (inputvalue == pin) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (build) {
                          return BottomNavigationScreen();
                        },
                      ),
                    );
                  } else {
                    popUP(context);
                  }
                },
                child: Container(
                  width: 170,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.lock_open_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  void popUP(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'PIN Salah',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          content: Text('Please enter the correct PIN.',
              textAlign: TextAlign.center),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}