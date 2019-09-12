
import 'dart:io';


String fixtureReader(String fileName){
  File file = File("test/fixtures/$fileName");
  return file.readAsStringSync();
}