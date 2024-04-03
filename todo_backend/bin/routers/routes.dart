import 'package:shelf_router/shelf_router.dart';

import '../apis/apis.dart';

class AppRoutes {
  static final Apis _api = Apis();
  static final router = Router()
    ..post('/login', _api.initRoute)
    ..get('/echo/<message>', _api.echoHandler);
}
