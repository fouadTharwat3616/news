import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.news);

  final News news;

  @override
  Widget build(BuildContext context) {
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget: (_, __, ___) => const Center(
                child: Icon(
                  Icons.error_outline_outlined,
                  size: 40,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            news.source?.name ?? '',
            style: titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: AppTheme.lightNavyColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            news.title ?? '',
            style: titleSmall,
          ),
          const SizedBox(height: 4),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(news.publishedAt!),
              style: titleSmall?.copyWith(color: AppTheme.lightNavyColor),
            ),
          ),
        ],
      ),
    );
  }
}
