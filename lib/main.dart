import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fluid_card.dart';
import 'fluid_carousel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FluidCarousel(
          children: [
            FluidCard(
              imageColorName: 'Red',
              altColor: Color(0xFF4259B2),
              title: "Start Your Day \nwith Peaceful Mornings",
              subtitle: "Wake up refreshed with calming nature-inspired sounds designed to ease you into the day.",
            ),
            FluidCard(
              imageColorName: 'Yellow',
              altColor: Color(0xFF904E93),
              title: "Refresh Your Mind \nwith Guided Breathing",
              subtitle: "Reduce stress and boost focus with science-backed breathing techniques at your fingertips.",
            ),
            FluidCard(
              imageColorName: 'Blue',
              altColor: Color(0xFFFFB138),
              title: "Sleep Soundly \nwith Soothing Stories",
              subtitle:
                  "Drift into deep sleep with a collection of relaxing bedtime stories and mindfulness exercises.",
            ),
          ],
        ),
      ),
    );
  }
}
