import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smarthome/model/post.dart';

class MenuLampuTidur extends StatefulWidget {
  @override
  _MenuLampuTidurState createState() => _MenuLampuTidurState();
}

class _MenuLampuTidurState extends State<MenuLampuTidur> {
  @override
  int warna = 0;
  int hasil;
  int brightness;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Widget buildBrightness(){
    return TextFormField(
      decoration: InputDecoration(labelText: "0-100"),
      keyboardType: TextInputType.number,
      maxLength: 3,
      validator: (String value){
        if(value.isEmpty){
          return 'Input Openness';
        }
      },
      onSaved: (String value){
        hasil = int.parse(value);
      },
    );
  }


  Widget build(BuildContext context) {
    final DatabaseReference database = FirebaseDatabase.instance.reference();
    database.child('gedung30/lab_iit/lampu_tidur/on_off').once().then((
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
    database.child('gedung30/lab_iit/lampu_tidur/brightness').once().then((DataSnapshot data){
      var hasil = data.value;
      setState(() {
        brightness = hasil;
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
            'Lampu Tidur Setting',
          ),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Image.asset('images/lamp$warna.jpg'),
            ),
            SizedBox(height: 10,),
            Text(
              "BRIGHTNESS",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "$brightness",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Form(
              child: buildBrightness(),
              key: formkey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (warna == 0) {
                            updateStatus(true, 'lampu_tidur');
                            warna = 1;
                          }
                          else {
                            updateStatus(false, 'lampu_tidur');
                            warna = 0;
                            UpdateBrightness(0);
                          }
                        });
                      },
                      icon: Icon(
                        Icons.power_settings_new,
                        color: Colors.black12,),
                      iconSize: 70,
                    )
                ),
                Expanded(
                    child: IconButton(
                      onPressed: () {
                        if(!formkey.currentState.validate()){
                          return;
                        }
                        formkey.currentState.save();
                        setState(() {
                          brightness = hasil;
                        });
                        UpdateBrightness(brightness);
                      },
                      icon: Icon(
                        Icons.cloud_upload,
                        color: Colors.black12,),
                      iconSize: 70,
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
