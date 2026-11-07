import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;
  bool _remember = true;
  String _centro = 'Planta Central - Tejeduría & Hilatura';

  InputDecoration _inputDec({required String hint, required IconData icon, Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF8B949E)),
      prefixIcon: Icon(icon, color: const Color(0xFF8B949E), size: 20),
      suffixIcon: suffix,
      filled: true,
      fillColor: const Color(0xFF1C2333),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF30363D))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF30363D))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF22C55E))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 48),
                        // Logo
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(color: const Color(0xFF22C55E), borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.eco, color: Colors.white, size: 28),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PantSys', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                Text('Hub Textil', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Text('Iniciar Sesión', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        const Text('Acceso a gestión operativa y control de planta textil', style: TextStyle(color: Color(0xFF8B949E), fontSize: 14)),
                        const SizedBox(height: 32),
                        // Email
                        const Text('Correo Corporativo / Usuario', style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 13, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDec(hint: 'operario.telar@pantsys.com', icon: Icons.email_outlined),
                        ),
                        const SizedBox(height: 16),
                        // Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Contraseña', style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 13, fontWeight: FontWeight.w500)),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(context, '/reset-password'),
                              child: const Text('¿Olvidaste tu contraseña?', style: TextStyle(color: Color(0xFF22C55E), fontSize: 13)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: _obscure,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDec(
                            hint: '••••••••••••',
                            icon: Icons.lock_outline,
                            suffix: IconButton(
                              icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: const Color(0xFF8B949E), size: 20),
                              onPressed: () => setState(() => _obscure = !_obscure),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Centro Operativo
                        const Text('Centro Operativo', style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 13, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C2333),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF30363D)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _centro,
                              isExpanded: true,
                              dropdownColor: const Color(0xFF1C2333),
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF8B949E)),
                              items: const [
                                DropdownMenuItem(
                                  value: 'Planta Central - Tejeduría & Hilatura',
                                  child: Row(children: [
                                    Icon(Icons.factory_outlined, color: Color(0xFF8B949E), size: 18),
                                    SizedBox(width: 8),
                                    Text('Planta Central - Tejeduría & Hilatura'),
                                  ]),
                                ),
                                DropdownMenuItem(
                                  value: 'Planta Norte - Confección',
                                  child: Row(children: [
                                    Icon(Icons.factory_outlined, color: Color(0xFF8B949E), size: 18),
                                    SizedBox(width: 8),
                                    Text('Planta Norte - Confección'),
                                  ]),
                                ),
                              ],
                              onChanged: (val) => setState(() => _centro = val!),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Checkbox
                        GestureDetector(
                          onTap: () => setState(() => _remember = !_remember),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: _remember ? const Color(0xFF22C55E) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: _remember ? const Color(0xFF22C55E) : const Color(0xFF30363D), width: 2),
                                ),
                                child: _remember ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
                              ),
                              const SizedBox(width: 10),
                              const Text('Terminal de planta confiable\n(mantener sesión activa)', style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 13)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Botón principal
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF22C55E),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                            child: const Text('Ingresar al Sistema →', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Divider
                        Row(
                          children: [
                            const Expanded(child: Divider(color: Color(0xFF30363D))),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text('CREDENCIALES DE RED', style: TextStyle(color: Color(0xFF8B949E), fontSize: 11, letterSpacing: 1.2)),
                            ),
                            const Expanded(child: Divider(color: Color(0xFF30363D))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Touch ID / Face ID
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.fingerprint, size: 20),
                                label: const Text('Touch ID'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFD1D5DB),
                                  side: const BorderSide(color: Color(0xFF30363D)),
                                  backgroundColor: const Color(0xFF1C2333),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.face_outlined, size: 20),
                                label: const Text('Face ID'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFD1D5DB),
                                  side: const BorderSide(color: Color(0xFF30363D)),
                                  backgroundColor: const Color(0xFF1C2333),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                PantSysBottomNav(currentIndex: 0, onTap: (_) {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
