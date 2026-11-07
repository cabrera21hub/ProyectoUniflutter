import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  final List<bool> _checks = [false, false, false, false];
  String _strength = 'Sin evaluar';
  Color _strengthColor = const Color(0xFF8B949E);

  void _onPasswordChanged(String val) {
    final checks = [
      val.length >= 8,
      val.contains(RegExp(r'[0-9]')),
      val.contains(RegExp(r'[!@#\$%\^&\*]')),
      val.contains(RegExp(r'[A-Z]')) && val.contains(RegExp(r'[a-z]')),
    ];
    final count = checks.where((c) => c).length;
    setState(() {
      for (int i = 0; i < 4; i++) _checks[i] = checks[i];
      if (val.isEmpty) {
        _strength = 'Sin evaluar';
        _strengthColor = const Color(0xFF8B949E);
      } else if (count <= 1) {
        _strength = 'Débil';
        _strengthColor = const Color(0xFFEF4444);
      } else if (count == 2) {
        _strength = 'Regular';
        _strengthColor = const Color(0xFFF97316);
      } else if (count == 3) {
        _strength = 'Buena';
        _strengthColor = const Color(0xFFEAB308);
      } else {
        _strength = 'Fuerte';
        _strengthColor = const Color(0xFF22C55E);
      }
    });
  }

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
    final policies = [
      'Mínimo 8 caracteres de longitud',
      'Al menos un número (0-9)',
      'Carácter especial (!@#\$%^&*)',
      'Mayúscula y minúscula combinadas',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                // AppBar custom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(color: const Color(0xFF22C55E), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.eco, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 8),
                      const Text('PANTSYS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFF22C55E), borderRadius: BorderRadius.circular(4)),
                        child: const Text('ERP', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      const Spacer(),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.person_outline, color: Color(0xFF8B949E), size: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        // User card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFF30363D)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(8)),
                                child: const Icon(Icons.lock_outline, color: Color(0xFF22C55E), size: 22),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('M. González', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                        const SizedBox(width: 6),
                                        const Text('#4092', style: TextStyle(color: Color(0xFF8B949E), fontSize: 13)),
                                      ],
                                    ),
                                    const Text('m.gonzalez@pantsys-textil.com', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(6)),
                                child: const Text('PLANTA-SUR', style: TextStyle(color: Color(0xFF22C55E), fontSize: 11, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        const Text('Restablecer Contraseña', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        const Text('Ingresa tu nueva clave operativa para terminales y sistema de planta textil.', style: TextStyle(color: Color(0xFF8B949E), fontSize: 13)),
                        const SizedBox(height: 28),
                        // Nueva contraseña
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Nueva Contraseña de Acceso', style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 13, fontWeight: FontWeight.w500)),
                            Text('Terminales ERP', style: TextStyle(color: const Color(0xFF8B949E), fontSize: 11)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: _obscureNew,
                          onChanged: _onPasswordChanged,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDec(
                            hint: 'Nueva clave alfanumérica',
                            icon: Icons.vpn_key_outlined,
                            suffix: IconButton(
                              icon: Icon(_obscureNew ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: const Color(0xFF8B949E), size: 20),
                              onPressed: () => setState(() => _obscureNew = !_obscureNew),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Strength bar
                        Row(
                          children: [
                            const Text('Seguridad de la clave', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                            const Spacer(),
                            Text(_strength, style: TextStyle(color: _strengthColor, fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: _checks.where((c) => c).length / 4,
                            backgroundColor: const Color(0xFF30363D),
                            color: _strengthColor,
                            minHeight: 4,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Policy
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF30363D)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Parámetros requeridos por política IT:', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                              const SizedBox(height: 10),
                              ...List.generate(4, (i) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: _checks[i] ? const Color(0xFF22C55E) : const Color(0xFF8B949E), width: 2),
                                        color: _checks[i] ? const Color(0xFF22C55E) : Colors.transparent,
                                      ),
                                      child: _checks[i] ? const Icon(Icons.check, color: Colors.white, size: 10) : null,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(policies[i], style: TextStyle(color: _checks[i] ? Colors.white : const Color(0xFF8B949E), fontSize: 13)),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Confirmar
                        const Text('Confirmar Nueva Contraseña', style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 13, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: _obscureConfirm,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDec(
                            hint: 'Reingresa la misma clave',
                            icon: Icons.sync,
                            suffix: IconButton(
                              icon: Icon(_obscureConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: const Color(0xFF8B949E), size: 20),
                              onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Botón
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton.icon(
                            onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard'),
                            icon: const Icon(Icons.vpn_key, size: 20),
                            label: const Text('Actualizar Contraseña y Acceder', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF22C55E),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.arrow_back, color: Color(0xFF8B949E), size: 16),
                                SizedBox(width: 6),
                                Text('Volver a Iniciar Sesión', style: TextStyle(color: Color(0xFF8B949E), fontSize: 14)),
                              ],
                            ),
                          ),
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
