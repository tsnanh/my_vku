import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:myvku/constants/constants.dart';
import 'package:myvku/models/news.dart';
import 'package:myvku/screens/news/pages/news/cubit/news_cubit.dart';
import 'package:myvku/screens/news/pages/news_state.dart';
import 'package:url_launcher/url_launcher.dart';

class PageNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<NewsCubit>(
        create: (context) => NewsCubit(NewsLoading())..getNewsClasses(),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsError) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else if (state is NewsSuccess) {
              return ListView.builder(
                itemCount: state.data.length,
                padding: const EdgeInsets.all(8),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => newsItemBuilder(
                  context,
                  state.data[index],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  final unescape = HtmlUnescape();

  Widget newsItemBuilder(BuildContext context, News data) {
    final textTheme = Theme.of(context).textTheme;
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
        padding: const EdgeInsets.only(bottom: 8, top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.categoryName.toUpperCase(),
              style: textTheme.overline,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              data.title,
              style: textTheme.headline5,
              maxLines: 2,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              data.updatedDate,
              style: textTheme.caption,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final url = "$NEWS_URL${data.cmsId}.html";
                    await canLaunch(url)
                        ? launch(url)
                        : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text("Failed to launch url!"),
                            ),
                          );
                  },
                  icon: Icon(Icons.remove_red_eye),
                  label: Text("SEE"),
                ),
                SizedBox(
                  width: 8,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  label: Text('SHARE'),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(Icons.more_vert),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
