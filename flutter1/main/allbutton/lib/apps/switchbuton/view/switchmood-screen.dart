import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const SwitchMood());
}

const dayColor = Color(0xFFd56352);
const nightColor = Color(0xFF1e2230);

class SwitchMood extends StatelessWidget {
  const SwitchMood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Night Switch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isNight = false;
  late AnimationController _controller;
  late Size size;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF414a4c),
      body: AnimatedContainer(
        color: isNight ? nightColor : dayColor,
        duration: const Duration(milliseconds: 300),
        child: Stack(
          children: <Widget>[
            ..._buildStars(20),
            isNight ? const _NightModeWidget() : const _DayModeWidget(),
            Center(
              child: _buildDayNightSwitch(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Transform.translate(
        offset: const Offset(160, -360),
        child: _buildSun(),
      ),
    );
  }

  Widget _buildDayNightSwitch() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isNight = !isNight;
        });
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isNight ? Colors.black : Colors.yellow,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: isNight ? 50 : 0,
              right: isNight ? 0 : 50,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  isNight ? Icons.nightlight_round : Icons.wb_sunny,
                  color: isNight ? Colors.black : Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSun() {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: AnimatedBuilder(
        animation:
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildContainer(400 * _controller.value),
              _buildContainer(500 * _controller.value),
              _buildContainer(600 * _controller.value),
              SizedBox(
                width: 256,
                height: 256,
                child: isNight
                    ? Image.asset('assets/moon.png')
                    : const CircleAvatar(
                        backgroundColor: Color(0xFFFDB813),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isNight ? Colors.amber[100] : Colors.orangeAccent)
            ?.withOpacity(1 - _controller.value),
      ),
    );
  }

  List<Widget> _buildStars(int starCount) {
    List<Widget> stars = [];
    for (int i = 0; i < starCount; i++) {
      stars.add(_buildStar(top: randomX, left: randomY, isNight: isNight));
    }
    return stars;
  }

  double get randomX {
    int maxX = (size.height).toInt();
    return Random().nextInt(maxX).toDouble();
  }

  double get randomY {
    int maxY = (size.width).toInt();
    return Random().nextInt(maxY).toDouble();
  }

  Widget _buildStar({
    double top = 0,
    double left = 0,
    bool isNight = false,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Opacity(
        opacity: isNight ? 1 : 0,
        child: const CircleAvatar(
          radius: 2,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

// Custom widget for Day Mode
class _DayModeWidget extends StatelessWidget {
  const _DayModeWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          height: 200,
          child: Image.asset(
            'assets/cloud.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          height: 200,
          child: Image.asset(
            'assets/mountain2.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -10,
          left: 0,
          right: 0,
          height: 140,
          child: Image.asset(
            'assets/mountain1.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

// Custom widget for Night Mode
class _NightModeWidget extends StatelessWidget {
  const _NightModeWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          height: 200,
          child: Image.asset(
            'assets/mountain2_night.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -10,
          left: 0,
          right: 0,
          height: 140,
          child: Image.asset(
            'assets/mountain_night.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -20,
          right: 0,
          left: 0,
          child: Transform.translate(
            offset: const Offset(50, 0),
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/cloud2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          right: 0,
          left: 0,
          child: Transform.translate(
            offset: const Offset(100, 0),
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/cloud3.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
