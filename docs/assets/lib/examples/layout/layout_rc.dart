import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/widgets.dart';

class LayoutRC extends Example {
  LayoutRC()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/layout/layout_rc.dart');
}

class MainWidget extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    int v = 1;
    Widget child1 = buildChild(v++);
    Widget child2 = buildChild(v++);
    Widget child3 = buildChild(v++);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingColumn([
        DockingItem(name: '2', widget: child2),
        DockingItem(name: '3', widget: child3)
      ])
    ]));
    Docking docking = Docking(layout: layout);
    return docking;
  }
}
