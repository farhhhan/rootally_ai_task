
import 'package:flutter/material.dart';

class AnimatedHeroWidget extends StatefulWidget {
  @override
  _AnimatedHeroWidgetState createState() => _AnimatedHeroWidgetState();
}

class _AnimatedHeroWidgetState extends State<AnimatedHeroWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    // Define the animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 210,
      right: 0,
      child: Hero(
        tag: 'health-risk-assessment',
        child: ScaleTransition(
          scale: _animation,
          child: Image.network(
            'https://s3-alpha-sig.figma.com/img/16a8/7631/c89fe67d48b96af237059fad956b91cd?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KKxnaaVYCNC-o20y~zeahb9eGyV7IqK2i82CCncHG0ZM0cRgnvY5quV9DFEUZ3R84wQx09XSpPHzPFEmCOK4geCeZwYjTQkNW2~UFjjky4MezkqG0QnS0YMfFNxlytiaGH6V3c757KJUSoUCSU3R46iCO6yZhnefg23Z4f6-tfCP1o5KiYs5SjPBGbB~nTrR3trflc8yC9ekAOWvngn3RhrCGMYzPHEXeOiabvaxrOXVHQQGGUhlBdfmvMVSnUQyc9WO9Od65BEw9jx0ealsEELUL69ZAVi26c2vtCsAec3JXnNGQf0hYoSiHHidbDyUCbmRyAaJAMRekSbAEjxwPA__',
          ),
        ),
      ),
    );
  }
}
