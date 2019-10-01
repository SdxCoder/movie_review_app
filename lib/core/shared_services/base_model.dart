import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';


class BaseModel extends ChangeNotifier{

  bool _buzy = false;


  bool get buzy => _buzy;

  void setBuzy(bool value){
    _buzy = value;
    notifyListeners();
  }

}