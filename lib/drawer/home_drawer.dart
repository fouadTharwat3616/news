import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onItemSelected;

  const HomeDrawer(this.onItemSelected);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge;
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            color: AppTheme.primaryColor,
            height: screenSize.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: bodyLargeStyle,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12),
              color: AppTheme.whiteColor,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      onItemSelected(DrawerItem.categories);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        const SizedBox(width: 8),
                        Text(
                          'Categories',
                          style: bodyLargeStyle?.copyWith(
                            color: AppTheme.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      onItemSelected(DrawerItem.settings);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(width: 8),
                        Text(
                          'Settings',
                          style: bodyLargeStyle?.copyWith(
                            color: AppTheme.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings;
}
