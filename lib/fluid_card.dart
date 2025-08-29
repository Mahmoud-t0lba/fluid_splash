import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FluidCard extends StatefulWidget {
  final String imageColorName;
  final Color altColor;
  final String title;
  final String subtitle;

  const FluidCard({
    super.key,
    required this.imageColorName,
    this.title = "",
    required this.subtitle,
    required this.altColor,
  });

  @override
  State<FluidCard> createState() => _FluidCardState();
}

class _FluidCardState extends State<FluidCard> {
  late Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker((d) {
      setState(() {});
    })..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        var time = DateTime.now().millisecondsSinceEpoch / 2000;
        var scaleX = 1.2 + sin(time) * 5;
        var scaleY = 1.2 + cos(time) * 7;
        var offsetY = 20 + cos(time) * 20;
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            /// todo: remove this if want to use only fluid image
            Transform.translate(
              offset: Offset(-(scaleX - 1) / 2 * width, -(scaleY - 1) / 2 * height + offsetY),
              child: Transform(
                transform: Matrix4.diagonal3Values(scaleX, scaleY, 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.altColor,
                    image: DecorationImage(
                      image: AssetImage('assets/images/Bg-${widget.imageColorName}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // child: Image.asset('assets/images/Bg-${widget.imageColorName}.png', fit: BoxFit.cover),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 75, bottom: 25),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          'assets/images/Illustration-${widget.imageColorName}.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 14, child: Image.asset('assets/images/Slider-${widget.imageColorName}.png')),
                    Expanded(
                      flex: 2,
                      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18), child: _buildBottomContent()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            height: 1,
            fontSize: 30,
            fontFamily: 'MarcellusSC',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          widget.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: 'Lexend',
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
