import 'package:flutter/material.dart';
import 'package:tp3/app/durations.dart';
import 'package:tp3/app/keys.dart';
import 'package:tp3/app/strings.dart';
import 'package:tp3/widget/learn_page.dart';
import 'package:tp3/widget/train_page.dart';

class UnderstandRoute extends StatefulWidget {
  const UnderstandRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UnderstandRouteState();
  }
}

class UnderstandRouteState extends State<UnderstandRoute> {
  final _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.title),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          LearnPage(key: PageStorageKey(Keys.learnPageKey)),
          TrainPage(key: PageStorageKey(Keys.trainPageKey)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
              title: Text(strings.learn), icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              title: Text(strings.train), icon: Icon(Icons.edit))
        ],
      ),
    );
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  void _onTabTapped(int pageIndex) {
    _onPageChanged(pageIndex);
    _pageController.animateToPage(_currentPageIndex,
        duration: Durations.pageTransitionDuration, curve: Curves.easeInOut);
  }
}
