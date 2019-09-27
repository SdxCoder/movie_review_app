

import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable{

  IFailure([List properties = const []]) : super([properties]);
}

class ServerFailure extends IFailure {}
class CacheFailure extends IFailure {}