import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/author_detail_icon.dart';
import 'package:flutter_list_page/utility/flavor_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/l10n/app_intl.dart';

class AuthorDetail extends ConsumerWidget {
  final Message message;

  const AuthorDetail({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.details,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          AuthorDetailIcon(
            message: message,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: EnvConfig.baseUrl + message.author!.photoUrl!,
                  width: 300, // Set a width
                  height: 300, // Set a height
                  fit: BoxFit.cover, // Ensures the image fills the circle
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.image,
                      size: 50, // Adjust size to fit the circle
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                message.author!.name!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                message.content!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
