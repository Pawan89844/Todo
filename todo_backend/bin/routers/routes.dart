import 'package:shelf_router/shelf_router.dart';

import '../apis/apis.dart';

class AppRoutes {
  static final Apis _api = Apis();
  static final router = Router()
    ..post('/signup', _api.signUp)
    ..post('/login', _api.login)
    ..get('/tasks', _api.getTasks);
}
