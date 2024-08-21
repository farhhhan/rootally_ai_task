import 'package:flutter/material.dart';

Row buildHomeButtons(BuildContext context) {
  // Calculate screen width and height
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  // Calculate button sizes and spacing based on screen size
  final buttonSize = screenWidth * 0.18;
  final imageHeight = screenHeight * 0.08;
  final imageWidth = screenWidth * 0.15;
  final spacing = screenWidth * 0.04;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FadeInAnimation(
        delay: 1,
        direction: FadeInDirection.ltr,
        fadeOffset: 30,
        child: HomeButton(
          widegts: SizedBox(
            height: imageHeight,
            width: imageWidth,
            child: Image.asset('images/heart.png'),
          ),
          label: "Key Bodys",
          label2: "Vital",
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
      ),
      SizedBox(width: spacing),
      FadeInAnimation(
        delay: 2.5,
        direction: FadeInDirection.ltr,
        fadeOffset: 30,
        child: HomeButton(
          widegts: SizedBox(
            height: imageHeight + 10,
            width: imageWidth,
            child: Image.asset('images/sketch_per.png'),
          ),
          label: "Posture",
          label2: "Analysis",
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
      ),
      SizedBox(width: spacing),
      FadeInAnimation(
        delay: 3.5,
        direction: FadeInDirection.ltr,
        fadeOffset: 30,
        child: HomeButton(
          widegts: SizedBox(
            height: imageHeight,
            width: imageWidth,
            child: Image.asset('images/per.png'),
          ),
          label: "Body",
          label2: "Composition",
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
      ),
      SizedBox(width: spacing),
      FadeInAnimation(
        delay: 4.5,
        direction: FadeInDirection.ltr,
        fadeOffset: 30,
        child: HomeButton(
          label: "Instant",
          label2: "Reports",
          widegts: CircleAvatar(
            backgroundColor: Colors.white,
            radius: buttonSize / 2.5,
            child: SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: Image.asset('images/letter.png'),
            ),
          ),
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
      ),
    ],
  );
}

class HomeButton extends StatelessWidget {
  final String label;
  final String label2;
  final VoidCallback onPressed;
  final Widget widegts;

  const HomeButton({
    super.key,
    required this.widegts,
    required this.label,
    required this.label2,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: Center(child: widegts),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
        Text(
          label2,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({
    super.key,
    required this.child,
    required this.delay,
    required this.direction,
    required this.fadeOffset,
  });

  final Widget child;
  final double delay;
  final double fadeOffset;
  final FadeInDirection direction;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> inAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: (800 * widget.delay).round()),
      vsync: this,
    );
    inAnimation =
        Tween<double>(begin: -widget.fadeOffset, end: 0).animate(controller)
          ..addListener(() {
            setState(() {});
          });

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: switch (widget.direction) {
        FadeInDirection.ltr => Offset(inAnimation.value, 0),
        FadeInDirection.rtl => Offset(-inAnimation.value, 0),
        FadeInDirection.ttb => Offset(0, inAnimation.value),
        FadeInDirection.btt => Offset(0, -inAnimation.value),
      },
      child: Opacity(
        opacity: opacityAnimation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum FadeInDirection {
  ltr,
  rtl,
  ttb,
  btt,
}
