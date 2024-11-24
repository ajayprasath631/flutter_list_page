import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/application/notifier/author_notifier.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/author_detail_icon.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/delete_popup.dart';
import 'package:flutter_list_page/utility/flavor_config.dart';
import 'package:flutter_list_page/utility/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/l10n/app_intl.dart';
import 'package:common/utility/time_formatter.dart';

class AuthorListTile extends ConsumerWidget {
  final int id;
  final bool? isSearchResult;
  const AuthorListTile({
    required this.id,
    this.isSearchResult = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref
        .watch(authorNotifierProvider.select((value) => value.messages))
        ?.firstWhere((element) => element.id == id);
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            MainAppRoute.authorDetail,
            arguments: {
              "message": message,
            },
          );
        },
        leading: ClipOval(
          child: CachedNetworkImage(
            width: 50,
            height: 50,
            imageUrl: EnvConfig.baseUrl + message!.author!.photoUrl!,
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!(isSearchResult ?? false)) AuthorDetailIcon(message: message),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeletePopup(message: message);
                  },
                );
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
        ),
      ),
    );
  }
}
