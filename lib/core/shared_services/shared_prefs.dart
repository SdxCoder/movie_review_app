import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
  static SharedPrefs _sharedPrefs;
  static SharedPreferences _preferences;

  SharedPrefs(){
    _init();
  }

  Future<void> _init() async {
    
    if(_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

  }

  static Future<SharedPrefs> getInstance() async {
    if(_sharedPrefs == null){
      _sharedPrefs = SharedPrefs();
    }

    if(_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _sharedPrefs;
  }


  getFromDisk(String key){
    var value = _preferences.get(key);
    Logger().i('(TRACE: SharedPrefs:_getFromDisk)  key: $key value: $value');
    return value;
  }


  saveToDisk<T>(String key ,T content){

    
    Logger().i('(TRACE: SharedPrefs:_saveToDisk\n Object:_${T.runtimeType})  \nkey: $key \nvalue: $content');


    if(content is String){
      _preferences.setString(key, content);
    }

    if(content is bool){
      _preferences.setBool(key, content);
    }

    if(content is int){
      _preferences.setInt(key, content);
    }

     if(content is double){
      _preferences.setDouble(key, content);
    }

    if(content is List<String>){
      _preferences.setStringList(key, content);
    }


  }
}