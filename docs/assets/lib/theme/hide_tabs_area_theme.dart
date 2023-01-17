import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class HideTabsAreaThemeExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => ExampleStateful();
}

class ExampleStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExampleState();
}

class ExampleState extends State<ExampleStateful> with ChildBuilderMixin {
  late DockingLayout _layout;
  bool _tabsAreaVisible = true;

  @override
  void initState() {
    super.initState();
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    Widget child3 = buildChild(3);
    _layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingTabs([
        DockingItem(name: '2', widget: child2),
        DockingItem(name: '3', widget: child3)
      ])
    ]));
  }

  @override
  Widget build(BuildContext context) {
    Widget checkbox = CheckboxListTile(
        value: _tabsAreaVisible,
        onChanged: (value) {
          setState(() {
            _tabsAreaVisible = !_tabsAreaVisible;
          });
        },
        title: Text('Tabs area visible'),
        controlAffinity: ListTileControlAffinity.leading);

    TabbedViewThemeData themeData = TabbedViewThemeData.classic();
    themeData.tabsArea.visible = _tabsAreaVisible;

    TabbedViewTheme tabbedViewTheme =
        TabbedViewTheme(child: Docking(layout: _layout), data: themeData);

    return Column(
        children: [checkbox, Expanded(child: tabbedViewTheme)],
        crossAxisAlignment: CrossAxisAlignment.stretch);
  }
}
