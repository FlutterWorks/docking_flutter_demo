import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class DividerThemeExample extends Example with ChildBuilderMixin {
  @override
  Widget buildMainWidget(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    Widget child3 = buildChild(3);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingColumn([
        DockingItem(name: '2', widget: child2),
        DockingItem(name: '3', widget: child3)
      ])
    ]));
    Docking docking = Docking(layout: layout);
    MultiSplitViewTheme theme = MultiSplitViewTheme(
        child: docking,
        data: MultiSplitViewThemeData(
            dividerThickness: 15,
            dividerPainter: DividerPainters.grooved2(
                backgroundColor: Colors.grey[700]!,
                color: Colors.grey[400]!,
                highlightedColor: Colors.white)));
    Container container = Container(
      padding: EdgeInsets.all(16),
      child: theme,
      color: Colors.grey[700]!,
    );
    return container;
  }
}
