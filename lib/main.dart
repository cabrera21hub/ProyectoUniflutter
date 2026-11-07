import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/edit_insumo_screen.dart';

void main() {
  runApp(const PantSysApp());
}

class PantSysApp extends StatelessWidget {
  const PantSysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PantSys Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        primaryColor: const Color(0xFF22C55E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF22C55E),
          surface: Color(0xFF161B22),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/reset-password': (_) => const ResetPasswordScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/edit-insumo': (_) => const EditInsumoScreen(),
      },
    );
  }
}
