import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'component/tabs_component.dart';

/* screen */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _duration = const Duration(seconds: 1);
  var _isLight = true;

  var pathTree = 'asset/images/land_tree_light.png';

  @override
  Widget build(BuildContext context) {

    onPress(int value) {
      setState(() => _isLight = (value == 0));
    }

    return AnimatedContainer(
      decoration: backgroundDecoration(_isLight),
      duration: _duration,
      child: Stack(
        children: [widgetSun(_duration, _isLight), widgetTree(_isLight, _duration), mainContainer(onPress)],
      ),
    );
  }
}

BoxDecoration backgroundDecoration(bool isLight) {
  var lightGradient = [const Color(0xFF8C2480), const Color(0xFFCE587D), const Color(0xFFFF9485), const Color(0xFFFFD4B5)];
  var darkGradient = [const Color(0xFF0D1441), const Color(0xFF283584), const Color(0xFF376AB2)];
  return BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: isLight ? lightGradient : darkGradient));
}

AnimatedPositioned widgetSun(Duration duration, bool isLight) => AnimatedPositioned(
    duration: duration, curve: Curves.easeInOut, bottom: (isLight ? 0 : -200), left: 0, right: 0, child: SvgPicture.asset('asset/icons/Sun.svg'));

AnimatedPositioned widgetTree(bool isLight, Duration duration) {
  var path = isLight ? 'asset/images/land_tree_light.png' : 'asset/images/land_tree_dark.png';
  return AnimatedPositioned(
      duration: duration, curve: Curves.easeInOut, bottom: -80, left: -20, right: -20, child: Image.asset(path, fit: BoxFit.fitWidth));
}

Widget mainContainer(ValueChanged<int> press) =>
    Padding(padding: const EdgeInsets.only(top: 50, left: 24, right: 24), child: Column(children: [Tabs(press: press)]));
