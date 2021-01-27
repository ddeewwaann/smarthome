
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smarthome/model/post.dart';

class MenuDispenser extends StatefulWidget {
  @override
  _MenuDispenserState createState() => _MenuDispenserState();
}

class _MenuDispenserState extends State<MenuDispenser> {
  @override
  int warna = 0;
  int panas = 0;
  int dingin = 0;
  Widget build(BuildContext context) {
    final DatabaseReference database = FirebaseDatabase.instance.reference();
    database.child('gedung30/lab_iit/dispenser/on_off').once().then((DataSnapshot data){
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
    database.child('gedung30/lab_iit/dispenser/cold/on_off').once().then((DataSnapshot data){
      bool hasildingin = data.value;
      setState(() {
        if(hasildingin==true){
          dingin = 1;
        }
        else{
          dingin=0;
        }
      });
    });
    database.child('gedung30/lab_iit/dispenser/hot/on_off').once().then((DataSnapshot data){
      bool hasilpanas = data.value;
      setState(() {
        if(hasilpanas==true){
          panas = 1;
        }
        else{
          panas=0;
        }
      });
    });
    setState(() {
      if(warna==0 && panas==0 && dingin==0){
        warna = 0;
      }
      else if(warna==1 && panas==0 && dingin==0){
        warna = 1;
      }
      else if(warna==1 && panas==0 && dingin==1){
        warna = 11;
      }
      else if(warna==1 && panas==1 && dingin==0){
        warna = 12;
      }
      else if(warna==1 && panas==1 && dingin==1){
        warna = 13;
      }
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
            'Menu Dispenser',
          ),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Image.asset(
                'images/dispenser$warna.jpg',
                height: 400,
                width: 400,
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                  ),
                  onPressed: (){
                    setState(() {
                      if(warna==1 && panas ==0){
                        UpdateDispenserCold(true);
                        warna = 11;
                        dingin =1;
                      }
                      else if(warna==12 && panas==1){
                        UpdateDispenserCold(true);
                        warna = 13;
                        dingin =1;
                      }
                      else if(warna==11 && dingin == 1 && panas==0){
                        UpdateDispenserCold(false);
                        warna = 1;
                        dingin = 0;
                      }
                      else if(warna==13 && dingin == 1 && panas==1){
                        UpdateDispenserCold(false);
                        warna = 12;
                        dingin = 0;
                      }
                    });
                  },
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      if(warna==0){
                        updateStatus(true, 'dispenser');
                        UpdateDispenserHot(false);
                        UpdateDispenserCold(false);
                        warna = 1;
                      }
                      else{
                        updateStatus(false, 'dispenser');
                        UpdateDispenserHot(false);
                        UpdateDispenserCold(false);
                        warna = 0;
                        dingin = 0;
                        panas = 0;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.black12,),
                  iconSize: 90,
                ),
                FlatButton(
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: (){
                    setState(() {
                      if(warna==1 && dingin ==0){
                        UpdateDispenserHot(true);
                        warna = 12;
                        panas =1;
                      }
                      else if(warna==11 && dingin==1){
                        UpdateDispenserHot(true);
                        warna = 13;
                        panas =1;
                      }
                      else if(warna==12 && dingin == 0 && panas==1){
                        UpdateDispenserHot(false);
                        warna = 1;
                        panas = 0;
                      }
                      else if(warna==13 && dingin == 1 && panas==1){
                        UpdateDispenserHot(false);
                        warna = 11;
                        panas = 0;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
