import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/interceptor.dart';

final InterceptedClient client = InterceptedClient.build(
  interceptors: [
    LoggingInterceptor(),
  ],
  requestTimeout: const Duration(seconds: 10),
);

Uri baseUrl(String path) => Uri(
    scheme: 'https',
    host: 'owen-wilson-wow-api.herokuapp.com',
    path: 'wows/$path');
// https://owen-wilson-wow-api.herokuapp.com/wows/