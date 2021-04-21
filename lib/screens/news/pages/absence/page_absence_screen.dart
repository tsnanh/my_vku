import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/models/absence.dart';
import 'package:myvku/screens/news/pages/absence/cubit/absence_cubit.dart';
import 'package:myvku/screens/news/pages/news_state.dart';

class PageAbsenceScreen extends StatefulWidget {
  @override
  _PageAbsenceScreenState createState() => _PageAbsenceScreenState();
}

class _PageAbsenceScreenState extends State<PageAbsenceScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<AbsenceCubit>(
      create: (context) => AbsenceCubit(NewsLoading())..getAbsences(),
      child: BlocBuilder<AbsenceCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsError) {
            return SnackBar(content: Text("Failed"));
          } else if (state is NewsSuccess) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListView.builder(
                itemCount: state.data.length,
                padding: EdgeInsets.all(8),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    absenceListItemBuilder(context, state.data[index]),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget absenceListItemBuilder(BuildContext context, Absence absence) {
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
              "Nghỉ ${absence.className} ngày ${absence.date.split(" ")[0]}",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${absence.title}. ${absence.lastName} ${absence.firstName}",
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
