import 'package:flutter/material.dart';

import '../pages/register/register_page.dart';

Map<String, Widget Function(BuildContext)> getApplicationRoutes() {
  return {
    RegisterPage.route: (BuildContext context) => const RegisterPage(),
  };
}
