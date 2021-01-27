import 'package:flutter/material.dart';
import 'package:smarthome/view/ac.dart';
import 'package:smarthome/view/gspeech.dart';
import 'package:smarthome/view/tirai.dart';
import 'package:smarthome/view/tv.dart';
import 'package:smarthome/view/listmenu.dart';
import 'package:smarthome/view/dispenser.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          backgroundColor: Colors.teal[200],
          title: Text(
            'Smart Home',
          ),
        ),
        body: PageHome(),
      ),
    );
  }
}
class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height:70,),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                  child: getCard(Icons.lightbulb_outline, 'Lampu'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ListLampu();
                    }));
                  },
                )
            ),
            Expanded(
                child: FlatButton(
                  child: getCard(Icons.ac_unit, 'AC'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MenuAC();
                    }));
                  },
                )
            ),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                  child: getCard(Icons.tv, 'TV'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MenuTV();
                    }));
                  },
                )
            ),
            Expanded(
                child: FlatButton(
                  child: getCard(Icons.view_column, 'Tirai'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return TiraiMenu();
                    }));
                  },
                )
            ),
          ],
        ),
        SizedBox(height: 15,),
        FlatButton(
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 85),
              leading: Icon(Icons.free_breakfast),
              title: Text(
                'Dispenser',
                style: getSize(),
              ),
              subtitle: Text(
                  'Tap to Menu'
              ),
            ),
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MenuDispenser();
            }));
          },
        ),
        FlatButton(
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 85),
              leading: Icon(Icons.keyboard_voice),
              title: Text(
                'Speech',
                style: getSize(),
              ),
              subtitle: Text(
                  'Tap to Menu'
              ),
            ),
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Audio_Recognize();
            }));
          },
        ),
      ],
    );
  }
}
TextStyle getSize(){
  return TextStyle(
    fontSize: 17,
  );
}

ListTile getPadding(){
  return ListTile(
    contentPadding: EdgeInsets.all(20),
  );
}

Card getCard(namaikon, title){
  return Card(
    child: ListTile(
      contentPadding: EdgeInsets.all(15),
      leading: Icon(namaikon),
      title: Text(
        title,
        style: getSize(),
      ),
      subtitle: Text(
          'Tap to Menu'
      ),
    ),
  );
}






