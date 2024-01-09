import 'package:flutter/material.dart';

class ExpandingFAB extends StatefulWidget {
  const ExpandingFAB({super.key});

  @override
  ExpandingFABState createState() => ExpandingFABState();
}

class ExpandingFABState extends State<ExpandingFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        buildFABOption(Icons.event, 'Events', 3),
        buildFABOption(Icons.pets, 'Patients', 2),
        buildFABOption(Icons.person, 'Clients', 1),
        rotatedFABOption(Icons.add, 'FABIcon', 0),
      ],
    );
  }

  Widget buildFABOption(IconData icon, String label, int index) {
    const double offset = 72.0;
    double translation = isExpanded ? offset * (index) : 0.0;
    bool isVisible = !(translation == 0 && index > 0);
    return AnimatedPositioned(
      bottom: translation,
      duration: const Duration(milliseconds: 200),
      child: FloatingActionButton(
        elevation: isVisible ? 6 : 0,
        onPressed: () {
          if (index == 0) {
            setState(() {
              isExpanded = !isExpanded;
              if (isExpanded) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            });
          }
        },
        heroTag: null,
        tooltip: label,
        child: Icon(icon),
      ),
    );
  }

  Widget rotatedFABOption(IconData icon, String label, int index) {
    const double offset = 72.0;
    double translation = isExpanded ? offset * (index) : 0.0;
    bool isVisible = !(translation == 0 && index > 0);
    return Positioned(
      bottom: translation,
      child: FloatingActionButton(
        elevation: isVisible ? 6 : 0,
        onPressed: () {
          if (index == 0) {
            setState(() {
              isExpanded = !isExpanded;
              if (isExpanded) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            });
          }
        },
        heroTag: null,
        tooltip: label,
        child: AnimatedRotation(
          turns: isExpanded ? -0.125 : 0,
          duration: const Duration(milliseconds: 200),
          child: Icon(icon),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
