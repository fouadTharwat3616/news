import 'package:flutter/material.dart';
import 'package:news/models/sources_response/source.dart';
import 'package:news/news/news_list.dart';
import 'package:news/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  final List<Source> sources;

  const SourcesTabs(this.sources);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) => setState(() => selectedIndex = index),
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    source: source,
                    isSelected: selectedIndex == widget.sources.indexOf(source),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(sourceId: widget.sources[selectedIndex].id ?? ''),
        ),
      ],
    );
  }
}
