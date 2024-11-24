import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/application/notifier/author_notifier.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/author_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/l10n/app_intl.dart';

class MySearchDelegate extends SearchDelegate {
  final WidgetRef ref;
  final TextEditingController searchController;

  MySearchDelegate({required this.ref, required this.searchController});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          searchController.clear();
          Navigator.of(context).pop();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final authorList = ref.read(
      authorNotifierProvider.select(
        (value) => value.messages
            ?.where(
              (element) => element.author!.name!
                  .toLowerCase()
                  .contains(query.toLowerCase().trim()),
            )
            .toList(),
      ),
    );
    if (authorList != null && authorList.isNotEmpty) {
      return Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space between the texts
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding here
                child: Text(
                  context.l10n.searchResults,
                  style: const TextStyle(fontSize: 16), // Customize text style
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding here
                child: Text(
                  context.l10n.founds(authorList.length),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ), // Customize text style
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: authorList.length,
              itemBuilder: (context, index) {
                return AuthorListTile(
                  id: authorList[index].id ?? 0,
                  isSearchResult: true,
                  key: ValueKey(authorList[index].id),
                );
              },
            ),
          ),
        ],
      );
    }
    return Center(child: Text(context.l10n.noMoreDataFoundText));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final authorList = ref.read(
      authorNotifierProvider.select(
        (value) => value.messages
            ?.where(
              (element) => element.author!.name!
                  .toLowerCase()
                  .contains(query.toLowerCase().trim()),
            )
            .toList(),
      ),
    );
    if (authorList != null && authorList.isNotEmpty) {
      return Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space between the texts
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding here
                child: Text(
                  context.l10n.searchResults,
                  style: const TextStyle(fontSize: 16), // Customize text style
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding here
                child: Text(
                  context.l10n.founds(authorList.length),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ), // Customize text style
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: authorList.length,
              itemBuilder: (context, index) {
                return AuthorListTile(
                  id: authorList[index].id ?? 0,
                  isSearchResult: true,
                  key: ValueKey(authorList[index].id),
                );
              },
            ),
          ),
        ],
      );
    }
    return Center(child: Text(context.l10n.noMoreDataFoundText));
  }
}
