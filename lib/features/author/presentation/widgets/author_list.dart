import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/application/notifier/author_notifier.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/author_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorListView extends ConsumerStatefulWidget {
  const AuthorListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthorListViewState();
}

class _AuthorListViewState extends ConsumerState<AuthorListView> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(authorNotifierProvider.notifier).getAuthors();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(authorNotifierProvider.notifier).getAuthors();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authorList = ref.read(
      authorNotifierProvider.select(
        (value) => value.messages,
      ),
    );
    final length = ref
        .watch(
          authorNotifierProvider.select(
            (value) => value.messages,
          ),
        )
        ?.length;
    if (authorList != null && authorList.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: length,
        itemBuilder: (context, index) {
          return AuthorListTile(
            id: authorList[index].id ?? 0,
            key: ValueKey(authorList[index].id),
          );
        },
      );
    }
    return Container();
  }
}
