import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class ButtonsBuilderExample extends Example {
  ButtonsBuilderExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/buttons_builder.dart');
}

class MainWidget extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    Widget child3 = buildChild(3);

    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingTabs([
        DockingItem(name: '2', widget: child2),
        DockingItem(name: '3', widget: child3)
      ])
    ]));
    Docking docking =
        Docking(layout: layout, dockingButtonsBuilder: _buttonsBuilder);
    return docking;
  }

  List<TabButton> _buttonsBuilder(BuildContext context,
      DockingTabs? dockingTabs, DockingItem? dockingItem) {
    if (dockingTabs != null) {
      // docking area is a DockingTabs
      return [
        TabButton(
            icon: IconProvider.data(Icons.tag_faces_outlined),
            onPressed: () => print('Smile!'))
      ];
    }
    // docking area is a DockingItem
    return [
      TabButton(
          icon: IconProvider.data(Icons.access_time),
          onPressed: () => print('Time button!'))
    ];
  }
}
