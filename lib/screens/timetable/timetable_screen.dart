import 'package:flutter/material.dart';
import 'package:myvku/widgets/vku_top_app_bar.dart';

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: VKUTopAppBar(),
      body: Container(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
