import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smarthome/model/post.dart';

class MenuTV extends StatefulWidget {
  @override
  _MenuTVState createState() => _MenuTVState();
}

class _MenuTVState extends State<MenuTV> {
  int warna = 0;
  Widget build(BuildContext context) {
    final DatabaseReference database = FirebaseDatabase.instance.reference();
    database.child('gedung30/lab_iit/tv/on_off').once().then((DataSnapshot data){
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
            'Menu TV',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Image.asset('images/tv$warna.jpg'),
            ),
            SizedBox(height: 50,),
            Center(
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      if(warna==0){
                        updateStatus(true,'tv');
                        warna = 1;
                      }
                      else{
                        updateStatus(false,'tv');
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
