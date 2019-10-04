

import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable{

  IFailure([List properties = const []]) : super([properties]);
}

class ServerFailure extends IFailure {
  final String msg = "Connecting To Network Failed";
}
class CacheFailure extends IFailure {
  final String msg = "No offline data";
}