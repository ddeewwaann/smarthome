import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smarthome/model/post.dart';
class TiraiMenu extends StatefulWidget {
  @override
  _TiraiMenuState createState() => _TiraiMenuState();
}

class _TiraiMenuState extends State<TiraiMenu> {
  int warna = 0;
  int openes;
  int hasil;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Widget buildOpennes(){
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
    database.child('gedung30/lab_iit/tirai/openness').once().then((DataSnapshot data){
      var hasil = data.value;
      setState(() {
        openes = hasil;
        if(hasil>0){
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
            'Menu Tirai',
          ),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Image.asset(
                'images/tirai$warna.png',
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "OPENNESS",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "$openes",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Form(
              child: buildOpennes(),
              key: formkey,
            ),
            Center(
                child: IconButton(
                  onPressed: (){
                    if(!formkey.currentState.validate()){
                      return;
                    }
                    formkey.currentState.save();
                    setState(() {
                      openes = hasil;
                    });
                    UpdateOpenness(openes);
                  },
                  icon: Icon(
                    Icons.backup,
                    color: Colors.black12,),
                  iconSize: 70,
                )
            ),
          ],
        ),
      ),
    );
  }
}
