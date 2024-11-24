import 'package:common/ui/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/application/notifier/author_notifier.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/author_list.dart';
import 'package:flutter_list_page/features/author/presentation/widgets/search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorListPage extends ConsumerWidget {
  const AuthorListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool?>(
      authorNotifierProvider.select((value) => value.isShowSnackbar),
      (previous, next) {
        if (next == true) {
          final String? message = ref.read(
            authorNotifierProvider.select((value) => value.toastMessage),
          );
          final bool isError = ref.read(
            authorNotifierProvider.select((value) => value.isError),
          );
          if (message != null && message != '') {
            CustomSnackBar().showSnackbar(
              msg: message,
              context: context,
              isError: isError,
            );
            ref.read(authorNotifierProvider.notifier).clearError();
          }
        }
      },
    );

    return Scaffold(
      appBar: const AuthorSearchBar(),
      body: SafeArea(
        child: Stack(
          children: [
            const Column(
              children: [
                Expanded(child: AuthorListView()),
              ],
            ),
            Consumer(
              builder: (context, ref, child) {
                final bool loading = ref.watch(
                  authorNotifierProvider.select((value) => value.isLoading),
                );
                if (loading) {
                  return Container(
                    color: Colors.grey[200]!.withAlpha(100),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
