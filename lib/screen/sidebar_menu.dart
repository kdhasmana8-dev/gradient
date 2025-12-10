import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassMenuDrawer extends StatelessWidget {
  const GlassMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0B0E17),
            Color(0xFF101A28),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _iconBadge(Icons.person),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Alice Portman",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      Text("Show Profile",
                          style: TextStyle(color: Colors.white38, fontSize: 13)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close,
                        color: Colors.white38, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              _sectionTitle("Account Setting"),
              _menuTile(Icons.notifications, "Notifications",
                  trailing: _badge("12")),
              _menuTile(Icons.credit_card, "Payment", isSelected: true),
              _menuTile(Icons.translate, "Translate"),
              _menuTile(Icons.shield_outlined, "Privacy"),
              const SizedBox(height: 22),
              _sectionTitle("Hosting"),
              _menuTile(Icons.list_alt, "Listing"),
              _menuTile(Icons.people_alt, "Host"),
              const SizedBox(height: 22),
              _sectionTitle("More"),
              _menuSwitchTile(Icons.dark_mode, "Dark Mode", true),
              _menuTile(Icons.update, "Update"),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }

  // 💠 HEX-Glass Icon Badge
  Widget _iconBadge(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF21304A),
            Color(0xFF1A2236),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Color(0x3340A0FF), width: 1),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF40A0FF).withOpacity(0.15),
              blurRadius: 12,
              spreadRadius: 2)
        ],
      ),
      child: Icon(icon, color: Colors.white70, size: 22),
    );
  }

  static Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF006DFF), Color(0xFF4BD1FF)],
        ),
      ),
      child: Text(text,
          style:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }

  Widget _menuTile(IconData icon, String title,
      {Widget? trailing, bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: isSelected
            ? const LinearGradient(
            colors: [Color(0xFF00305F), Color(0xFF0056D4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
            : null,
      ),
      child: ListTile(
        leading: _iconBadge(icon),
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 15)),
        trailing: trailing ??
            const Icon(Icons.chevron_right,
                size: 20, color: Colors.white38),
      ),
    );
  }

  Widget _menuSwitchTile(IconData icon, String title, bool value) {
    return Row(
      children: [
        _iconBadge(icon),
        const SizedBox(width: 14),
        Expanded(
            child:
            Text(title, style: const TextStyle(color: Colors.white))),
        Container(
          width: 52,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF0F1726),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF007BFF), Color(0xFF00D2FF)],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(title,
          style: const TextStyle(color: Colors.white54, fontSize: 12)),
    );
  }
}