import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smarthome/model/post.dart';

class MenuLampuTV extends StatefulWidget {
  @override
  _MenuLampuTVState createState() => _MenuLampuTVState();
}

class _MenuLampuTVState extends State<MenuLampuTV> {
  @override
  int warna = 0;

  Widget build(BuildContext context) {
      final DatabaseReference database = FirebaseDatabase.instance.reference();
      database.child('gedung30/lab_iit/lampu_keluarga/on_off').once().then((
          DataSnapshot data) {
            bool hasil = data.value;
            setState(() {
              if (hasil == true) {
                warna = 1;
              }
              else {
                warna = 0;
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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.teal[200],
            title: Text(
              'Lampu TV Setting',
            ),
          ),
          body: Column(
            children: <Widget>[
              Card(
                child: Image.asset('images/lamp$warna.jpg'),
              ),
              SizedBox(height: 50,),
              Center(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (warna == 0) {
                          updateStatus(true, 'lampu_keluarga');
                          warna = 1;
                        }
                        else {
                          updateStatus(false, 'lampu_keluarga');
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
