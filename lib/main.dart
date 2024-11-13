import 'package:flutter/material.dart';
import 'slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Biodata Diri",
        description:
            "Rifqi Naufal Luthfyardy\nProgram Studi Sarjana\nSistem Informasi\n5026211189",
        image: "assets/Fyar_3x4.jpg"), // Gunakan path sebagai string untuk asset JPG
    SliderPage(
        title: "Hobi",
        description:
            "Saya memiliki hobi mendaki gunung karena dengan menikmati pemandangan akan membuat diri menjadi tenang. Selain itu, saya juga suka traveling dan berburu kuliner khas di tempat-tempat baru.",
        image: "assets/Rinjani_1.jpg"),
    SliderPage(
        title: "Fun Fact",
        description:
            "Saat berlibur ke Singapura, saya pernah tersasar di suatu daerah yang saya kurang tahu dikarenakan terlewat satu pemberhentian bus. Namun, justru itu saya malah menemukan tempat kuliner yang viral di tiktok.",
        image: "assets/Chinatown_SG.jpg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 30, // Posisi status tag di bagian bawah
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(_pages.length, (int index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 10,
                  width: (index == _currentPage) ? 30 : 10,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (index == _currentPage)
                        ? Colors.blue
                        : Colors.blue.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
