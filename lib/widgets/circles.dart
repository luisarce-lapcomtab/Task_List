part of 'widgets.dart';

class CircleDecoration extends StatelessWidget {
  const CircleDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: -85,
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.16),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class WhiteCircle extends StatelessWidget {
  const WhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 40,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class SmallWhiteCircle extends StatelessWidget {
  const SmallWhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 100,
      top: 2,
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
