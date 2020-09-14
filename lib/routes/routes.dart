import 'package:flutter/cupertino.dart';
import 'package:mimessenger/pages/chat_page.dart';
import 'package:mimessenger/pages/loading_page.dart';
import 'package:mimessenger/pages/login_page.dart';
import 'package:mimessenger/pages/register_page.dart';
import 'package:mimessenger/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
