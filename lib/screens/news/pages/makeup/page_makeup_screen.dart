import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/models/makeup_class.dart';
import 'package:myvku/screens/news/pages/makeup/cubit/makeup_cubit.dart';
import 'package:myvku/screens/news/pages/makeup/cubit/makeup_state.dart';

class PageMakeupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MakeupCubit>(
      create: (context) => MakeupCubit(MakeupLoading())..getMakeupClasses(),
      child: BlocBuilder<MakeupCubit, MakeupState>(
        builder: (context, state) {
          if (state is MakeupLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MakeupError) {
            return Container();
          } else if (state is MakeupSuccess) {
            return ListView.builder(
              padding: EdgeInsets.all(8),
              physics: BouncingScrollPhysics(),
              itemCount: state.makeupClasses.length,
              itemBuilder: (context, index) =>
                  makeupItemBuilder(context, state.makeupClasses[index]),
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
}
