part of 'widgets.dart';

class BulletPoint extends StatelessWidget {
  const BulletPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            right: 4.0,
            top: 0.0,
            bottom: 0.0,
            child: Container(
              width: 2.0,
              color: Colors.grey,
            ),
          ),
          Positioned(
            right: 0,
            top: 9,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
