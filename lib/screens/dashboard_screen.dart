import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _filter = 0;
  int _navIndex = 0;

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
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(color: const Color(0xFF22C55E), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.eco, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PantSys', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Hub Textil', style: TextStyle(color: Color(0xFF8B949E), fontSize: 10)),
                        ],
                      ),
                      const Spacer(),
                      Stack(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(8)),
                            child: const Icon(Icons.notifications_outlined, color: Color(0xFF8B949E), size: 20),
                          ),
                          Positioned(
                            right: 6,
                            top: 6,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(color: Color(0xFFF97316), shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.person_outline, color: Color(0xFF8B949E), size: 20),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(color: const Color(0xFF22C55E), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.add, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Breadcrumb
                        Row(
                          children: [
                            const Icon(Icons.grid_view, color: Color(0xFF22C55E), size: 14),
                            const SizedBox(width: 6),
                            const Text('MÓDULO INVENTARIO', style: TextStyle(color: Color(0xFF22C55E), fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.8)),
                            const Text(' • ', style: TextStyle(color: Color(0xFF8B949E))),
                            const Text('ALMACÉN A-3', style: TextStyle(color: Color(0xFF22C55E), fontSize: 11, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text('Control de Insumos & Lotes', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        // Stats
                        Row(
                          children: [
                            Expanded(child: _StatCard(title: 'Lotes Activos', value: '1,420', sub: '+2%', subColor: const Color(0xFF22C55E), icon: Icons.inventory_2_outlined, iconColor: const Color(0xFF22C55E))),
                            const SizedBox(width: 10),
                            Expanded(child: _StatCard(title: 'Stock Crítico', value: '8 SKUs', sub: 'Déficit planta', subColor: const Color(0xFFF97316), icon: Icons.warning_amber_outlined, iconColor: const Color(0xFFF97316))),
                            const SizedBox(width: 10),
                            Expanded(child: _StatCard(title: 'Valor Total', value: '\$482.9K', sub: 'USD Estándar', subColor: const Color(0xFF8B949E), icon: Icons.attach_money, iconColor: const Color(0xFF8B949E))),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Search
                        Container(
                          decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF30363D))),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Icon(Icons.search, color: Color(0xFF8B949E), size: 20),
                              ),
                              const Expanded(
                                child: TextField(
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                  decoration: InputDecoration(
                                    hintText: 'Buscar por SKU, lote o descripción...',
                                    hintStyle: TextStyle(color: Color(0xFF8B949E), fontSize: 14),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Icon(Icons.qr_code_scanner, color: const Color(0xFF8B949E), size: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Filtros
                        Row(
                          children: [
                            _FilterChip(label: 'Todos (146)', isActive: _filter == 0, onTap: () => setState(() => _filter = 0)),
                            const SizedBox(width: 8),
                            _FilterChip(label: 'Crítico (8)', isActive: _filter == 1, onTap: () => setState(() => _filter = 1)),
                            const SizedBox(width: 8),
                            _FilterChip(label: 'Disponible (140)', isActive: _filter == 2, onTap: () => setState(() => _filter = 2)),
                          ],
                        ),
                        const SizedBox(height: 14),
                        // Items
                        _InsumoCard(
                          sku: 'TE-MEZ-001',
                          skuColor: const Color(0xFF3B82F6),
                          status: 'NORMAL / DISP.',
                          statusColor: const Color(0xFF22C55E),
                          name: 'Tela Mezclilla',
                          desc: 'Color azul marino, mezclilla',
                          extra: Column(
                            children: [
                              const SizedBox(height: 8),
                              Row(children: [
                                const Text('Stock en Planta: 4,500 m', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                                const Spacer(),
                                const Text('Min: 1,200 m', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                              ]),
                              const SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: const LinearProgressIndicator(value: 0.75, minHeight: 5, backgroundColor: Color(0xFF30363D), color: Color(0xFF22C55E)),
                              ),
                            ],
                          ),
                          onTap: () => Navigator.pushNamed(context, '/edit-insumo'),
                        ),
                        const SizedBox(height: 10),
                        _CriticalCard(onTap: () {}),
                        const SizedBox(height: 10),
                        _InsumoCard(
                          sku: 'B-ME-0026',
                          skuColor: const Color(0xFF8B5CF6),
                          skuSuffix: ' Lote #TIN-884',
                          status: 'NORMAL / DISP.',
                          statusColor: const Color(0xFF22C55E),
                          name: 'Boton Metalico',
                          desc: 'Boton metalico de broche',
                          extra: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(children: [
                              const Text('En Depósito: 1,250 kg', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                              const Spacer(),
                              const Text('Min: 400 kg', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                            ]),
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),
                        _AuditCard(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                PantSysBottomNav(
                  currentIndex: _navIndex,
                  onTap: (i) => setState(() => _navIndex = i),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String sub;
  final Color subColor;
  final IconData icon;
  final Color iconColor;

  const _StatCard({required this.title, required this.value, required this.sub, required this.subColor, required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF161B22), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF30363D))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(title, style: const TextStyle(color: Color(0xFF8B949E), fontSize: 10))),
              Icon(icon, color: iconColor, size: 14),
            ],
          ),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(sub, style: TextStyle(color: subColor, fontSize: 10)),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({required this.label, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF22C55E) : const Color(0xFF1C2333),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isActive ? const Color(0xFF22C55E) : const Color(0xFF30363D)),
        ),
        child: Text(label, style: TextStyle(color: isActive ? Colors.white : const Color(0xFF8B949E), fontSize: 12, fontWeight: isActive ? FontWeight.w600 : FontWeight.normal)),
      ),
    );
  }
}

class _InsumoCard extends StatelessWidget {
  final String sku;
  final Color skuColor;
  final String? skuSuffix;
  final String status;
  final Color statusColor;
  final String name;
  final String desc;
  final Widget? extra;
  final VoidCallback? onTap;

  const _InsumoCard({required this.sku, required this.skuColor, this.skuSuffix, required this.status, required this.statusColor, required this.name, required this.desc, this.extra, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: const Color(0xFF161B22), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF30363D))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: skuColor.withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                  child: Row(children: [
                    Text(sku, style: TextStyle(color: skuColor, fontSize: 11, fontWeight: FontWeight.bold)),
                    if (skuSuffix != null) Text(skuSuffix!, style: TextStyle(color: skuColor.withOpacity(0.7), fontSize: 11)),
                  ]),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: statusColor.withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                  child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(desc, style: const TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
            if (extra != null) extra!,
          ],
        ),
      ),
    );
  }
}

class _CriticalCard extends StatelessWidget {
  final VoidCallback onTap;
  const _CriticalCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEF4444).withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: const Color(0xFFF97316).withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                child: const Row(children: [
                  Text('HIL-AL-002', style: TextStyle(color: Color(0xFFF97316), fontSize: 11, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Text('URGENTE', style: TextStyle(color: Color(0xFFF97316), fontSize: 11, fontWeight: FontWeight.bold)),
                ]),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: const Color(0xFFEF4444).withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                child: const Text('STOCK CRÍTICO', style: TextStyle(color: Color(0xFFEF4444), fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Hilo Algodón Peinado 30/1 Crudo', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          const Text('Conos para tejeduría circular • Telar 04 & 07 en riesgo', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('Existencias: ', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
              const Text('180 kg', style: TextStyle(color: Color(0xFFF97316), fontSize: 12, fontWeight: FontWeight.w600)),
              const Spacer(),
              const Text('Min Requerido: 600 kg', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.arrow_downward, color: Color(0xFFF97316), size: 14),
              const Text('Déficit: -420 kg', style: TextStyle(color: Color(0xFFF97316), fontSize: 12, fontWeight: FontWeight.w600)),
              const Spacer(),
              const Text('Corte est.: 18 hrs', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _AuditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFF161B22), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF30363D))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.local_shipping_outlined, color: Color(0xFF8B949E), size: 18),
              const SizedBox(width: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Auditoría Rápida de Muelle', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                  Text('Recepción entrante en Puerta 02', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_up, color: Color(0xFF8B949E), size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: const Color(0xFF22C55E).withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                child: const Text('#LT-2624-918', style: TextStyle(color: Color(0xFF22C55E), fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(4)),
                child: const Text('Aprobado Lab', style: TextStyle(color: Color(0xFF8B949E), fontSize: 11)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Hilo Poliéster Texturizado 150D', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 2),
          const Text('Guía Revisión: GR-89021 • 3,200 kg', style: TextStyle(color: Color(0xFF8B949E), fontSize: 12)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline, size: 18),
                  label: const Text('Confirmar Descarga & Ubicar', style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22C55E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFF30363D))),
                child: const Icon(Icons.cancel_outlined, color: Color(0xFF8B949E), size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
