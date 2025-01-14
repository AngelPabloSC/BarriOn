import 'package:flutter/material.dart';
import './pages/Login.dart';
import './pages/consultas_screen.dart';
import './routes/UserController.dart';

final List<Route> publicRoutes = [
  MaterialPageRoute(builder: (context) => HomePage(), settings: RouteSettings(name: "/")),
  MaterialPageRoute(builder: (context) => LoginPage(), settings: RouteSettings(name: "/login")),
  MaterialPageRoute(builder: (context) => RegisterPage(), settings: RouteSettings(name: "/register")),
];