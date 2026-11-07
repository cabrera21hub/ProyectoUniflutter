import 'package:flutter/material.dart';

class PantSysBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const PantSysBottomNav({super.key, this.currentIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        border: Border(top: BorderSide(color: Color(0xFF30363D))),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              _Item(icon: Icons.inventory_2_outlined, activeIcon: Icons.inventory_2, label: 'Insumos', isActive: currentIndex == 0, onTap: () => onTap?.call(0)),
              _Item(icon: Icons.receipt_long_outlined, activeIcon: Icons.receipt_long, label: 'Órdenes', isActive: currentIndex == 1, onTap: () => onTap?.call(1)),
              _Item(icon: Icons.precision_manufacturing_outlined, activeIcon: Icons.precision_manufacturing, label: 'Hilandería', isActive: currentIndex == 2, onTap: () => onTap?.call(2)),
              _Item(icon: Icons.verified_outlined, activeIcon: Icons.verified, label: 'Calidad', isActive: currentIndex == 3, onTap: () => onTap?.call(3)),
              _Item(icon: Icons.menu, activeIcon: Icons.menu, label: 'Menú', isActive: currentIndex == 4, onTap: () => onTap?.call(4)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const _Item({required this.icon, required this.activeIcon, required this.label, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF22C55E) : const Color(0xFF8B949E);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isActive ? activeIcon : icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: isActive ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
