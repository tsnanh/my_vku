import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/screens/news/pages/news/cubit/news_cubit.dart';
import 'package:myvku/screens/news/pages/news_state.dart';

class PageNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NewsCubit>(
        create: (context) => NewsCubit(NewsLoading())..getNewsClasses(),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsError) {
              return Container();
            } else if (state is NewsSuccess) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
