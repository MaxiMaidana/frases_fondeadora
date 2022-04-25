import 'package:flutter/material.dart';

import '../features/auth/presentation/pages/auth_page.dart';
import '../features/home/presentation/pages/home_page.dart';

Map<String, Widget Function(BuildContext)> mapRoutes() => {
      '/auth': (BuildContext context) => const AuthPage(),
      '/home': (BuildContext context) => const HomePage()
    };
