import 'package:flutter/material.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({required this.sourceId});

  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          }
          final newsList = viewModel.newsList;
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
        },
      ),
    );
  }
}
