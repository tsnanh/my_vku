import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/models/makeup_class.dart';
import 'package:myvku/screens/news/pages/makeup/cubit/makeup_cubit.dart';
import 'package:myvku/screens/news/pages/news_state.dart';

class PageMakeupScreen extends StatefulWidget {
  @override
  _PageMakeupScreenState createState() => _PageMakeupScreenState();
}

class _PageMakeupScreenState extends State<PageMakeupScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<MakeupCubit>(
      create: (context) => MakeupCubit(NewsLoading())..getMakeupClasses(),
      child: BlocBuilder<MakeupCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsError) {
            return Container();
          } else if (state is NewsSuccess) {
            return ListView.builder(
              padding: EdgeInsets.all(8),
              physics: BouncingScrollPhysics(),
              itemCount: state.data.length,
              itemBuilder: (context, index) =>
                  makeupItemBuilder(context, state.data[index]),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget makeupItemBuilder(BuildContext context, MakeupClass makeupClass) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ABSENCE",
              style: Theme.of(context).textTheme.overline,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Bù ${makeupClass.className} ngày ${makeupClass.dateMakeup.split(" ")[0]}",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${makeupClass.title}. ${makeupClass.lastName} ${makeupClass.firstName}",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
