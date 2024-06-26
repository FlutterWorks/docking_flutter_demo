import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/widgets.dart';

class LayoutRCR extends Example {
  LayoutRCR()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/layout/layout_rcr.dart');
}

class MainWidget extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    int v = 1;
    Widget child1 = buildChild(v++);
    Widget child2 = buildChild(v++);
    Widget child3 = buildChild(v++);
    Widget child4 = buildChild(v++);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingColumn([
        DockingRow([
          DockingItem(name: '2', widget: child3),
          DockingItem(name: '3', widget: child4)
        ]),
        DockingItem(name: '4', widget: child2)
      ])
    ]));
    Docking docking = Docking(layout: layout);
    return docking;
  }
}
