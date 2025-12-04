import 'dart:ui';
import 'package:flutter/material.dart';

class SideMenu3D extends StatefulWidget {
  const SideMenu3D({super.key});

  @override
  State<SideMenu3D> createState() => _SideMenu3DState();
}

class _SideMenu3DState extends State<SideMenu3D>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  void toggleMenu() {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F25),
      body: Stack(
        children: [
          _buildSideMenu(),
          _buildMainContent(),
        ],
      ),
    );
  }

  // ---------------- SIDE MENU ---------------- //
  Widget _buildSideMenu() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(-250 + controller.value * 250, 0),
          child: Container(
            width: 250,
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1C1C33), Color(0xFF090E23)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Alice Portman",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text("Silver Member",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 35),

                    menuItem(Icons.notifications, "Notifications"),
                    menuItem(Icons.payment, "Payment", highlight: true),
                    menuItem(Icons.translate, "Translate"),
                    menuItem(Icons.lock, "Privacy"),

                    const SizedBox(height: 20),
                    const Divider(color: Colors.white24),

                    menuItem(Icons.list_alt, "Listing"),
                    menuItem(Icons.home_work, "Host"),

                    const SizedBox(height: 20),
                    const Divider(color: Colors.white24),

                    // Dark mode toggle
                    Row(
                      children: [
                        Icon(Icons.dark_mode_outlined,
                            color: Colors.white.withOpacity(0.8)),
                        const SizedBox(width: 12),
                        const Text("Dark Mode",
                            style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                        const Spacer(),
                        Switch(
                            value: true,
                            onChanged: (_) {},
                            activeColor: Colors.white)
                      ],
                    ),

                    menuItem(Icons.update, "Updates"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget menuItem(IconData icon, String title, {bool highlight = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: highlight
          ? BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3AA0FF), Color(0xFF7B66FF)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      )
          : null,
      child: ListTile(
        leading: Icon(icon,
            color: highlight ? Colors.white : Colors.white.withOpacity(0.7)),
        title: Text(title,
            style: TextStyle(
                color: highlight ? Colors.white : Colors.white70,
                fontWeight: highlight ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }

  // ---------------- MAIN SCREEN WITH 3D ROTATION ---------------- //
  Widget _buildMainContent() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double slide = 250 * controller.value;
        double rotate = -0.25 * controller.value;

        return Transform(
          transform: Matrix4.identity()
            ..translate(slide)
            ..rotateY(rotate),
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: toggleMenu,
            child: AbsorbPointer(
              absorbing: controller.value != 0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/room.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),

                    // Menu Button
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: toggleMenu,
                        ),
                      ],
                    ),

                    const Spacer(),

                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Welcome Home!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
