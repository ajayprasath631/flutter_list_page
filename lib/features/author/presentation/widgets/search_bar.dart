import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/my_search_delegate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/l10n/app_intl.dart';

class AuthorSearchBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AuthorSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthorSearchBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AuthorSearchBarState extends ConsumerState<AuthorSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(230, 230, 230, 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: context.l10n.search,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12.0,
                  ),
                ),
                onSubmitted: (value) {
                  showSearch(
                    context: context,
                    query: value, // Pass the submitted text
                    delegate: MySearchDelegate(
                      ref: ref,
                      searchController: _searchController,
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.grey),
              onPressed: () {
                showSearch(
                  query: _searchController.text,
                  context: context,
                  delegate: MySearchDelegate(
                    ref: ref,
                    searchController: _searchController,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
