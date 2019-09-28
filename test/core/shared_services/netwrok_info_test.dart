import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_review_app/core/shared_services/network_info.dart';


class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}


void main(){
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfo networkInfo;

  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfo(mockDataConnectionChecker);
  });


  test('should call data connection checker', () async {
    final networkStatus = true;
    when(mockDataConnectionChecker.hasConnection).thenAnswer((_) async{
      return networkStatus;
    });

    final actual =  await networkInfo.getConnectivityStatus();

    verify(mockDataConnectionChecker.hasConnection);
    expect(actual, networkStatus);
  });
}