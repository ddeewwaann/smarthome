import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
final DatabaseReference database = FirebaseDatabase.instance.reference();

void updateStatus(bool status, String barang){
  if(status==true){
    database.child('gedung30/lab_iit/$barang').update({
      'on_off' : true
    });
  }
  else{
    database.child('gedung30/lab_iit/$barang').update({
      'on_off' : false
    });
  }
}

void UpdateDispenserCold(bool cold){
  if(cold == true){
    database.child('gedung30/lab_iit/dispenser/cold').update({
      'on_off' : true
    });
  }
  else{
    database.child('gedung30/lab_iit/dispenser/cold').update({
      'on_off' : false
    });
  }
}

void UpdateDispenserHot(bool hot){
  if(hot == true){
    database.child('gedung30/lab_iit/dispenser/hot').update({
      'on_off' : true
    });
  }
  else{
    database.child('gedung30/lab_iit/dispenser/hot').update({
      'on_off' : false
    });
  }
}

void UpdateOpenness(int value){
  database.child('gedung30/lab_iit/tirai').update({
    'openness' : value
  });
}
void UpdateBrightness(int value){
  database.child('gedung30/lab_iit/lampu_tidur').update({
    'brightness' : value
  });
}

void UpdateVoice(perintah){
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss').format(now);
  database.child('gedung30/lab_iit/voice').update({
    'command' : perintah,
    'timestamp': formattedDate
  });
}

void updateDispenser(bool dingin, bool panas){
  if(dingin==true && panas==true){
    database.child('gedung30/lab_iit/dispenser/cold').update({
      'on_off' : true
    });
    database.child('gedung30/lab_iit/dispenser/hot').update({
      'on_off' : true
    });
  }
  else if(dingin==true && panas==false){
    database.child('gedung30/lab_iit/dispenser/cold').update({
      'on_off' : true
    });
    database.child('gedung30/lab_iit/dispenser/hot').update({
      'on_off' : false
    });
  }
  else if(dingin==false && panas==true){
    database.child('gedung30/lab_iit/dispenser/cold').update({
      'on_off' : false
    });
    database.child('gedung30/lab_iit/dispenser/hot').update({
      'on_off' : true
    });
  }
  else if(dingin==false && panas==false){
    database.child('gedung30/lab_iit/dispenser/cold').update({
      'on_off' : false
    });
    database.child('gedung30/lab_iit/dispenser/hot').update({
      'on_off' : false
    });
  }
}