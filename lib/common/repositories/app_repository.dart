import 'package:dio_http/dio_http.dart';

import '../http/api.dart';

class AppRepository {
  final dio = Dio();
  late RestClient _client = RestClient(dio);
}
