import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gradient/screen/calender_page.dart';

class LuxuryStayPage1 extends StatelessWidget {
  const LuxuryStayPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1F),
      body: Stack(
        children: [
          // BACKGROUND GLOW TOP
          Positioned(
            top: -120,
            left: -80,
            child: Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.blueAccent.withOpacity(0.25),
                    Colors.transparent,
                  ],
                  radius: 0.85,
                ),
              ),
            ),
          ),

          // BACKGROUND GLOW BOTTOM
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.purpleAccent.withOpacity(0.28),
                    Colors.transparent,
                  ],
                  radius: 0.85,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BACK BUTTON
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);   // ← your back action
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Back",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),


                const SizedBox(height: 10),

                // MAIN CARD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.10),
                              Colors.white.withOpacity(0.03),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.10),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // IMAGE
                            Container(
                              height: 220,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/wallpaper3.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(height: 14),

                            // HOST ROW
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 22,
                                    backgroundImage:
                                    AssetImage("assets/user.jpg"),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Hosted by Trang",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Luxury, Lifestyle",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 14),

                            // RATINGS
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.star,
                                      size: 16, color: Colors.amber),
                                  SizedBox(width: 4),
                                  Text("4.9",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                  SizedBox(width: 10),
                                  Text("1,656 reviews",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 14)),
                                  SizedBox(width: 10),
                                  Icon(Icons.verified,
                                      size: 16, color: Colors.lightBlueAccent),
                                  SizedBox(width: 4),
                                  Text("Superhost",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 14)),
                                ],
                              ),
                            ),

                            const SizedBox(height: 14),

                            // LOCATION
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.location_on,
                                      size: 18, color: Colors.white70),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      "1956 Rue Streetplace Ouest, Toronto, Canada K3A 2Z4",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 22),

                            // BOOK NOW → NAVIGATE
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookAvailableDatePage(
                                      priceText: "\$200 CAD / night",
                                      initialRangeText: "Select dates",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                margin:
                                const EdgeInsets.symmetric(horizontal: 14),
                                padding:
                                const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3AA0FF),
                                      Color(0xFF7B66FF),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Book Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // FOOTER SHADE
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.05),
                        Colors.white.withOpacity(0.02),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
