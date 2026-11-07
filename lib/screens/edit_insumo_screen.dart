import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class EditInsumoScreen extends StatefulWidget {
  const EditInsumoScreen({super.key});

  @override
  State<EditInsumoScreen> createState() => _EditInsumoScreenState();
}

class _EditInsumoScreenState extends State<EditInsumoScreen> {
  int _selectedColor = 1;
  final List<Color> _colors = [
    const Color(0xFF9CA3AF),
    const Color(0xFF22C55E),
    const Color(0xFFF97316),
    const Color(0xFF3B82F6),
    const Color(0xFFE5E7EB),
  ];

  Widget _lightInput({required String value, IconData? prefixIcon, bool readOnly = false, String? trailingText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: readOnly ? const Color(0xFFF3F4F6) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          if (prefixIcon != null) ...[
            Icon(prefixIcon, size: 18, color: readOnly ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280)),
            const SizedBox(width: 10),
          ],
          Expanded(child: Text(value, style: TextStyle(fontSize: 14, color: readOnly ? const Color(0xFF9CA3AF) : const Color(0xFF111827)))),
          if (trailingText != null) Text(trailingText, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _sectionLabel(String label, {Widget? trailing}) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF374151), fontSize: 13, fontWeight: FontWeight.w600)),
        if (trailing != null) ...[const Spacer(), trailing],
      ],
    );
  }

  Widget _badge(String text, {Color color = const Color(0xFF22C55E), Color textColor = Colors.white}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                // AppBar
                Container(
                  color: const Color(0xFF161B22),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Detalle De Lote', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      const Spacer(),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(color: Color(0xFF22C55E), shape: BoxShape.circle),
                        child: const Icon(Icons.person_outline, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Editar Insumo header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFFE5E7EB))),
                          child: Row(
                            children: [
                              const Icon(Icons.edit_outlined, color: Color(0xFF374151), size: 18),
                              const SizedBox(width: 8),
                              const Text('Editar Insumo', style: TextStyle(color: Color(0xFF111827), fontWeight: FontWeight.w600, fontSize: 15)),
                              const Spacer(),
                              _badge('Lote #LT-2624-589'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Imagen del producto
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Container(
                                height: 170,
                                width: double.infinity,
                                color: const Color(0xFFD1D5DB),
                                child: const Center(
                                  child: Icon(Icons.image, size: 64, color: Color(0xFF9CA3AF)),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.transparent, Color(0xCC000000)],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(color: const Color(0xFF22C55E), borderRadius: BorderRadius.circular(4)),
                                        child: const Text('FICHA TÉCNICA ACTIVA', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text('Trazabilidad de Fornitura', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // SKU
                        _sectionLabel('Código Identificador (SKU)'),
                        const SizedBox(height: 8),
                        _lightInput(value: 'HEBI-NET-081', prefixIcon: Icons.lock_outline, readOnly: true, trailingText: 'Solo Lectura'),
                        const SizedBox(height: 14),
                        // Nombre
                        _sectionLabel('Nombre del Insumo / Material', trailing: _badge('Válido', color: const Color(0xFFDCFCE7), textColor: const Color(0xFF16A34A))),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF22C55E))),
                          child: const Row(
                            children: [
                              Expanded(child: Text('Hebilla Zamak Cromada 35mm Reforzada', style: TextStyle(fontSize: 14, color: Color(0xFF111827)))),
                              Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Categoría
                        _sectionLabel('Categoría de Producción'),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                          child: const Row(
                            children: [
                              Expanded(child: Text('Fornituras & Herrajes', style: TextStyle(fontSize: 14, color: Color(0xFF111827)))),
                              Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7280), size: 22),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        // UoM
                        _sectionLabel('Unidad de Medida (UoM)'),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                          child: const Row(
                            children: [
                              Expanded(child: Text('Unidades (un)', style: TextStyle(fontSize: 14, color: Color(0xFF111827)))),
                              Column(
                                children: [
                                  Icon(Icons.keyboard_arrow_up, color: Color(0xFF6B7280), size: 18),
                                  Icon(Icons.keyboard_arrow_down, color: Color(0xFF6B7280), size: 18),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Stock
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Stock Disponible', style: TextStyle(color: Color(0xFF6B7280), fontSize: 11)),
                                    SizedBox(height: 4),
                                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                      Text('4588', style: TextStyle(color: Color(0xFF111827), fontSize: 22, fontWeight: FontWeight.bold)),
                                      SizedBox(width: 4),
                                      Padding(padding: EdgeInsets.only(bottom: 2), child: Text('UN', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12))),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Stock Mínimo Seguridad', style: TextStyle(color: Color(0xFF6B7280), fontSize: 11)),
                                    SizedBox(height: 4),
                                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                      Text('1280', style: TextStyle(color: Color(0xFF111827), fontSize: 22, fontWeight: FontWeight.bold)),
                                      SizedBox(width: 4),
                                      Padding(padding: EdgeInsets.only(bottom: 2), child: Text('UN', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12))),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        // Colores
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Muestra de Color / Acabado', style: TextStyle(color: Color(0xFF6B7280), fontSize: 11)),
                                    const SizedBox(height: 4),
                                    const Text('Tintóreo', style: TextStyle(color: Color(0xFF374151), fontSize: 13, fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: List.generate(_colors.length, (i) => GestureDetector(
                                        onTap: () => setState(() => _selectedColor = i),
                                        child: Container(
                                          margin: const EdgeInsets.only(right: 8),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: _colors[i],
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: _selectedColor == i ? const Color(0xFF111827) : Colors.transparent,
                                              width: 2.5,
                                            ),
                                          ),
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Cromo Satinado', style: TextStyle(color: Color(0xFF374151), fontSize: 12, fontWeight: FontWeight.w500)),
                                  Text('Industrial', style: TextStyle(color: Color(0xFF374151), fontSize: 12, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Notas
                        _sectionLabel('Notas de Trazabilidad & Calidad', trailing: _badge('AQL 1.5', color: const Color(0xFFEFF6FF), textColor: const Color(0xFF2563EB))),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                          child: const Text(
                            'Lote Inspeccionado bajo protocolo AQL 1.5. Resistencia a tracción y medida salina conforme a norma ISO-2023. Aprobado para confección línea alta exigencia.',
                            style: TextStyle(color: Color(0xFF374151), fontSize: 13, height: 1.5),
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Última modificación
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE5E7EB))),
                          child: Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(8)),
                                child: const Icon(Icons.access_time, color: Color(0xFF16A34A), size: 20),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Última Modificación', style: TextStyle(color: Color(0xFF6B7280), fontSize: 11)),
                                    SizedBox(height: 2),
                                    Text('Hoy 08:42 • Terminal Móvil Tejido #4 (Op. Carlos M.)', style: TextStyle(color: Color(0xFF374151), fontSize: 12)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Botón Guardar
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.save_outlined, size: 20),
                            label: const Text('Guardar Cambios', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF22C55E),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text('Cancelar', style: TextStyle(color: Color(0xFF6B7280), fontSize: 14)),
                          ),
                        ),
                        const SizedBox(height: 20),
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
