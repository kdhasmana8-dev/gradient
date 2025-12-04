import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient/screen/deatils2_page.dart';
import 'package:gradient/screen/details_page.dart';
import 'package:gradient/screen/payment_page.dart';



class PropertyHomePage extends StatefulWidget {
  const PropertyHomePage({super.key});

  @override
  State<PropertyHomePage> createState() => _PropertyHomePageState();
}

class _PropertyHomePageState extends State<PropertyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1624),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // -----------------------------
              // TOP MENU + SEARCH
              // -----------------------------
              Row(
                children: [
                  GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SideMenu3D()));
              },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2334),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                  ),
                  const SizedBox(width: 12),

                  // Search Bar
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C2334),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 10),
                          const Text("Where to?",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 16)),
                          const Spacer(),
                          const Icon(Icons.mic, color: Colors.grey),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // -----------------------------
              // PROPERTY CARD LIST
              // -----------------------------
              Expanded(
                child: ListView(
                  children: [
                    buildPropertyCard(
                      img: "assets/images/wallpaper.jpg",
                      location: "Toronto, Canada",
                      price: "\$200 CAD / night",
                      distance: "257 km",
                      date: "Oct 24 - 26",
                      rating: "4.1 (1,648)",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LuxuryStayPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    buildPropertyCard(
                      img: "assets/images/wallpaper3.jpg",
                      location: "Toronto, Canada",
                      price: "\$200 CAD / night",
                      distance: "257 km",
                      date: "Oct 24 - 26",
                      rating: "4.1 (1,648)",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LuxuryStayPage1()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // -----------------------------
      // BOTTOM NAVIGATION BAR
      // -----------------------------
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Color(0xFF1C2334),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.radar, color: Colors.blueAccent, size: 32),
            Icon(Icons.flight, color: Colors.white, size: 28),
            Icon(Icons.favorite_border, color: Colors.white, size: 28),
            Icon(Icons.message, color: Colors.white, size: 28),
          ],
        ),
      ),
    );
  }
}

//
// ⭐ RATING BADGE UI (same as screenshot)
//
Widget ratingBadge(String rating) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.55),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: Colors.lightBlueAccent, size: 18),
        const SizedBox(width: 6),
        Text(
          rating,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

//
// PROPERTY CARD WIDGET
//
Widget buildPropertyCard({
  required String img,
  required String location,
  required String price,
  required String distance,
  required String date,
  required String rating,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C2334),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------
          // IMAGE + BADGE + FAVORITE ICON
          // -----------------------------
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.asset(
                  img,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // ⭐ Rating Badge (top center)
              Positioned(
                top: 12,
                left: 0,
                right: 0,
                child: Center(child: ratingBadge(rating)),
              ),

              // ❤️ Favorite Icon
              const Positioned(
                right: 16,
                top: 16,
                child: Icon(Icons.favorite_border,
                    color: Colors.white, size: 28),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // LOCATION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              location,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // -----------------------------
          // COST | DISTANCE | DATE BOX
          // -----------------------------
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              color: Color(0xFF1C2334),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cost
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("COST",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text(price,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15)),
                  ],
                ),

                // Distance
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("DISTANCE",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Row(
                      children: [
                        const Icon(Icons.navigation,
                            color: Colors.cyanAccent, size: 16),
                        const SizedBox(width: 4),
                        Text(distance,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ],
                ),

                // Available
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("AVAILABLE",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            color: Colors.cyanAccent, size: 16),
                        const SizedBox(width: 4),
                        Text(date,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



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