import 'package:flutter/material.dart';
import 'package:tp3/app/strings.dart';
import 'package:tp3/grapheme/grapheme_model.dart';
import 'package:tp3/widget/learn_tab.dart';
import 'package:tp3/widget/train_tab.dart';

class GraphemeRoute extends StatefulWidget {
  final List<GraphemeModel> graphemes;

  const GraphemeRoute({Key key, this.graphemes}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GraphemeRouteState();
  }
}

class GraphemeRouteState extends State<GraphemeRoute>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<Widget> _tabList = [LearnTab(), TrainTab()];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = Strings.of(context);
    return DefaultTabController(
      length: _tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.title),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(title: Text(strings.learn), icon: Icon(Icons.book)),
            BottomNavigationBarItem(title: Text(strings.train), icon: Icon(Icons.edit))
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _tabController.animateTo(_currentIndex);
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }
}
