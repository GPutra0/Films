import 'package:aktivitas_1/api/apiCotroller.dart';
import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  Future<List<dynamic>>? _data;

  @override
  void initState() {
    _data = ApiController().getdatas();
    super.initState();
  }

  List movie =[
    {
      "img": "assets/img/2.png"
    },
    {
      "img": "assets/img/10.jpeg"
    },
    {
      "img": "assets/img/11.jpeg"
    },
    {
      "img": "assets/img/20.jpeg"
    },
    {
      "img": "assets/img/19.jpeg"
    },
    {
      "img": "assets/img/16.jpeg"
    },
    {
      "img": "assets/img/17.jpeg"
    },
  ];

  bool aleh=false;
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar:AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FutureBuilder<List<dynamic>>(
              future: _data, builder: (context, snapshot){
              if (snapshot.hasData){
                return SizedBox(
                  width: 600,
                  height: 550,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return listMovie(
                        img: 'https://saiyaapi.site/${snapshot.data![index]['photo']}',
                        desc: snapshot.data![index]['desc'],
                      );
                    },
                  ),
            );
              } else {
               return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            }),
      ), 
    );
  }

  Center listMovie({required img, required desc}) {
    return Center(
            child: Padding(
              padding: const EdgeInsets.only(top:10),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Center(
                    child : Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      width: 189,
                      height: 267,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 16,
                          offset: Offset(0, 0),
                          spreadRadius: -6,
                        )
                      ],
                        image:DecorationImage(
                          image: NetworkImage(
                            img,
                            ),
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  Center(
                    child: InkWell(
                onTap: () {setState(() {
                 aleh=!aleh; 
                });},
                child: Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color:!aleh? Colors.white:Colors.blue,
                ),
                child: Center(
                  child: Text('Play',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color:!aleh? Colors.blue:Colors.white,
                  ),
                  ),
                  ),
                  margin: EdgeInsets.all(20.0),
                ),
                ),
                ),
                  
                Center(
                  child: Container(
                  width: 300,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Color.fromARGB(255, 103, 105, 105).withOpacity(0.3),
                    ),
                  child: Center(
                    child: Text(
                    desc,
                      style: TextStyle(fontSize: 12.0,
                      color: Colors.white),
                      textAlign: TextAlign.justify,
                  ) 
                  ),
                )
                ),
                ],
                ),
              ),
            ),
          );
  }
}