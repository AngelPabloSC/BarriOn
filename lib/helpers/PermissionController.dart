import 'package:flutter/material.dart';

  class PermissionController with ChangeNotifier {
  // Definir rutas según el rol
  final List<String> adminRoutes = [
    "/admin",
    "/admin/courses",
    "/admin/add_student",
    "/admin/manage_courses",
  ];

  final List<String> studentRoutes = [
    "/student",
    "/student/profile",
    "/student/certificates",
    "/student/payments",
  ];

  // Función para filtrar las rutas disponibles según el rol del usuario
  List<String> getAvailableRoutes(String role) {
    if (role == 'admin') {
      return adminRoutes;
    } else {
      return studentRoutes;
    }
  }
}