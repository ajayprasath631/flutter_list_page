import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/application/notifier/author_notifier.dart';
import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorDetailIcon extends ConsumerWidget {
  final Message message;

  const AuthorDetailIcon({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavourite = ref.watch(
      authorNotifierProvider.select(
        (value) {
          final matchingElement = value.messages?.firstWhere(
            (element) => element.id == message.id,
            orElse: () => Message(
              content: null,
              updated: null,
              id: null,
              author: null,
              isFavourite: null,
            ), // Provide a fallback value
          );
          return matchingElement?.isFavourite ?? false; // Handle null safely
        },
      ),
    );
    return IconButton(
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: isFavourite ? Colors.red : null,
      ),
      onPressed: () {
        ref
            .read(authorNotifierProvider.notifier)
            .updateFavourite(message: message);
      },
    );
  }
}
