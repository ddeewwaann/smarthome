import 'package:flutter/material.dart';
import 'package:smarthome/view/lampuTV.dart';
import 'package:smarthome/view/lampuTaman.dart';
import 'package:smarthome/view/lampuTamu.dart';
import 'package:smarthome/view/lampuTidur.dart';

class ListLampu extends StatefulWidget {
  @override
  _ListLampuState createState() => _ListLampuState();
}

class _ListLampuState extends State<ListLampu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.teal[200],
          title: Text(
            'List Lampu',
          ),
        ),
        body: PageList(),
      ),
    );
  }
}

class PageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height:70,),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                  child: getCard(Icons.lightbulb_outline, 'Taman'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MenuLampu();
                    }));
                  },
                )
            ),
            Expanded(
                child: FlatButton(
                  child: getCard(Icons.lightbulb_outline, 'Tamu'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MenuLampuTamu();
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
                  child: getCard(Icons.lightbulb_outline, 'Tidur'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MenuLampuTidur();
                    }));
                  },
                )
            ),
            Expanded(
                child: FlatButton(
                  child: getCard(Icons.lightbulb_outline, 'TV'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MenuLampuTV();
                    }));
                  },
                )
            ),
          ],
        ),
        SizedBox(height: 15,)
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
          'Tap to Setting'
      ),
    ),
  );
}
