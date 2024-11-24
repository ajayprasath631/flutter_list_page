import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/utility/time_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/application/notifier/author_notifier.dart';
import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_list_page/utility/flavor_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/l10n/app_intl.dart';

class DeletePopup extends ConsumerWidget {
  final Message message;
  const DeletePopup({required this.message, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      title: Text(
        context.l10n.deleteThisAuthor,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      contentPadding: const EdgeInsets.all(6),
      content: ListTile(
        leading: ClipOval(
          child: CachedNetworkImage(
            width: 50,
            height: 50,
            imageUrl: EnvConfig.baseUrl + message.author!.photoUrl!,
            errorWidget: (context, url, error) => Center(
              child: Text(context.l10n.noMoreDataFoundText),
            ),
          ),
        ),
        title: Text(
          message.author!.name!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          context.l10n
              .yearsAgo(DateUtilsFormatter.calculateYearsAgo(message.updated!)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
          },
          child: Text(
            context.l10n.cancel,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            ref
                .read(authorNotifierProvider.notifier)
                .deleteRecord(id: message.id ?? 0);
            ref.read(authorNotifierProvider.notifier).showSnackbar(
                  isError: false,
                  message: context.l10n.deletedSuccessfully,
                );
            Navigator.of(context).pop();
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
          ),
          child: Text(
            context.l10n.delete,
            style: const TextStyle(color: Colors.red, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
