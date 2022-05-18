import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/interceptor.dart';

final InterceptedClient client = InterceptedClient.build(
  interceptors: [
    LoggingInterceptor(),
  ],
  requestTimeout: const Duration(seconds: 10),
);

Uri baseUrl(String path) =>
    Uri.parse('https://owen-wilson-wow-api.herokuapp.com/wows/$path');
// https://owen-wilson-wow-api.herokuapp.com/wows/