// Package imports:
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_list_page/features/author/application/author_logic.dart';
import 'package:flutter_list_page/features/author/application/provider/author_provider_container.dart';
import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_list_page/utility/network_connectivity/network_connectivity_provider_container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_notifier.g.dart';
part 'author_notifier.freezed.dart';

@freezed
abstract class AuthorState with _$AuthorState {
  const factory AuthorState({
    @Default(false) bool isLoading,
    @Default(false) bool isShowSnackbar,
    @Default(false) bool isError,
    String? toastMessage,
    String? searchText,
    int? limit,
    String? pageToken,
    List<Message>? messages,
    @Default(false) bool navigateToDetailPage,
  }) = _AuthorState;

  factory AuthorState.fromJson(Map<String, Object?> json) =>
      _$AuthorStateFromJson(json);

  const AuthorState._();
}

@riverpod
class AuthorNotifier extends _$AuthorNotifier {
  late NetworkConnectivity networkConnectivity;
  late AuthorLogic authorLogic;
  List<Message>? localList = [];
  Future<void> getAuthors() async {
    try {
      showLoading();
      await networkConnectivity.checkNetwork().then((available) async {
        if (available) {
          final result = await authorLogic.fetchAuthorList(
            pageToken: state.pageToken,
            limit: state.limit,
          );
          result.fold(
            (error) {
              showSnackbar(isError: true, message: error.message);
            },
            (authors) {
              localList?.addAll(authors.messages);
              state = state.copyWith(
                messages: localList?.toList(),
                pageToken: authors.pageToken,
                limit: authors.count,
              );
            },
          );
        } else {
          showSnackbar(isError: true, message: 'No internet connection');
        }
        hideLoading();
      });
    } catch (e, stacktrace) {
      FirebaseCrashlytics.instance.recordError(e, stacktrace);
      hideLoading();
    }
  }

  Future<void> searchAuthor({String? searchText}) async {
    try {
      showLoading();
      final tempList = state.messages!
          .where((element) => element.author!.name!.contains(searchText!))
          .toList();
      state = state.copyWith(messages: tempList);
      hideLoading();
    } catch (e, stacktrace) {
      FirebaseCrashlytics.instance.recordError(e, stacktrace);
      hideLoading();
    }
  }

  Future<void> updateFavourite({required Message message}) async {
    state.messages
        ?.firstWhere((element) => element.id == message.id)
        .isFavourite = !(message.isFavourite ?? false);
    state = state.copyWith(messages: state.messages);
  }

  Future<void> deleteRecord({required int id}) async {
    localList?.removeWhere((element) => element.id == id);
    state = state.copyWith(messages: localList?.toList());
  }

  void showLoading() {
    state = state.copyWith(isLoading: true);
  }

  void hideLoading() {
    state = state.copyWith(isLoading: false);
  }

  void clearError() {
    state = state.copyWith(
      isError: false,
      toastMessage: null,
      isShowSnackbar: false,
    );
  }

  void showSnackbar({required bool isError, required String message}) {
    state = state.copyWith(
      toastMessage: message,
      isError: isError,
      isShowSnackbar: true,
    );
  }

  void navigateToDetailPage() {
    state = state.copyWith(navigateToDetailPage: true);
  }

  @override
  AuthorState build() {
    networkConnectivity = ref.read(networkConnectivityProvider);
    authorLogic = ref.read(authorUseCaseProvider);
    return const AuthorState();
  }
}
