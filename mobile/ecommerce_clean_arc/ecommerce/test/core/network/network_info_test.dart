import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce/core/platform/network_info.dart';
import '../../helpers/repo_mocks/new/test_helper.mocks.dart';

void main() {
  late NetworkInfoImp networkinfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkinfo = NetworkInfoImp(internetconnection: mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test('should forward a call to InternetConnectionChecker', () async {
      final tHasConnection = Future.value(true);
			
      when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) => tHasConnection);

      final result = networkinfo.isConnected;
			verify(mockInternetConnectionChecker.hasConnection);
			expect(result , tHasConnection);
    });
  });
}

