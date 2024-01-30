import 'package:aktivitas_1/page2.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Video Prime',
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blue,
              ),
            )
          ),  
        ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2, 
          children: <Widget>[
            InkWell(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (build){
            return page2();
          },
          ),
          );
        },
        splashColor: Color.fromARGB(255, 255, 255, 255),
            child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                image: AssetImage(
                  'assets/img/12.jpeg',
                  ),
                  fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(20.0),
        ), 
        ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                image: AssetImage(
                  'assets/img/13.jpg',
                  ),
                  fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(20.0),
        ),
         Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                image: AssetImage(
                  'assets/img/25.jpeg',
                  ),
                  fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(20.0),
        ), 
        Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                image: AssetImage(
                  'assets/img/22.png',
                  ),
                  fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(20.0),
        ),
         Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                image: AssetImage(
                  'assets/img/23.png',
                  ),
                  fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(20.0),
        ), 
        Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                image: AssetImage(
                  'assets/img/24.jpeg',
                  ),
                  fit: BoxFit.cover,
          ),
        ),
        margin: EdgeInsets.all(20.0),
        ),
          ],
        ), 
    ),
   );
  }
}