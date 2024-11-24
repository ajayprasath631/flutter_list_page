// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorStateImpl _$$AuthorStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthorStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      isShowSnackbar: json['isShowSnackbar'] as bool? ?? false,
      isError: json['isError'] as bool? ?? false,
      toastMessage: json['toastMessage'] as String?,
      searchText: json['searchText'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      pageToken: json['pageToken'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      navigateToDetailPage: json['navigateToDetailPage'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthorStateImplToJson(_$AuthorStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isShowSnackbar': instance.isShowSnackbar,
      'isError': instance.isError,
      'toastMessage': instance.toastMessage,
      'searchText': instance.searchText,
      'limit': instance.limit,
      'pageToken': instance.pageToken,
      'messages': instance.messages,
      'navigateToDetailPage': instance.navigateToDetailPage,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authorNotifierHash() => r'39be45bf5e49f2f68ee2651a6a152be08f0d458e';

/// See also [AuthorNotifier].
@ProviderFor(AuthorNotifier)
final authorNotifierProvider =
    AutoDisposeNotifierProvider<AuthorNotifier, AuthorState>.internal(
  AuthorNotifier.new,
  name: r'authorNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authorNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthorNotifier = AutoDisposeNotifier<AuthorState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
