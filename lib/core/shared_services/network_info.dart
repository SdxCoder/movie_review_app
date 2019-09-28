import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> getConnectivityStatus();
}

class NetworkInfo implements INetworkInfo{

  final DataConnectionChecker dataConnectionChecker;

  NetworkInfo(this.dataConnectionChecker);

  @override
  Future<bool> getConnectivityStatus() async {
   return await dataConnectionChecker.hasConnection;
  }

  StreamSubscription<DataConnectionStatus> subscribe(Function callback){
    return dataConnectionChecker.onStatusChange.listen(callback);
  }

  Future<void> cancelSubscription(StreamSubscription<DataConnectionStatus> listner) async{
    await listner.cancel();
  }

}
