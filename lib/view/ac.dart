import 'package:flutter/material.dart';
import 'package:smarthome/model/post.dart';
import 'package:firebase_database/firebase_database.dart';

class MenuAC extends StatefulWidget {
  @override
  _MenuACState createState() => _MenuACState();
}


class _MenuACState extends State<MenuAC> {
  int warna = 0 ;
  bool stat;
  Widget build(BuildContext context) {
    final DatabaseReference database = FirebaseDatabase.instance.reference();
    database.child('gedung30/lab_iit/ac/on_off').once().then((DataSnapshot data){
      bool hasil = data.value;
      setState(() {
        if(hasil==true){
          warna = 1;
        }
        else{
          warna=0;
        }
      });
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.teal[200],
          title: Text(
            'Menu AC',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Image.asset('images/ac$warna.jpg'),
            ),
            SizedBox(height: 50,),
            Center(
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      if(warna==0){
                        updateStatus(true,'ac');
                        warna = 1;
                      }
                      else{
                        updateStatus(false,'ac');
                        warna = 0;
                      }
                    });

                  },
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.black12,),
                  iconSize: 90,
                )
            ),
          ],
        ),
      ),
    );
  }
}