// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorState _$AuthorStateFromJson(Map<String, dynamic> json) {
  return _AuthorState.fromJson(json);
}

/// @nodoc
mixin _$AuthorState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isShowSnackbar => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String? get toastMessage => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  String? get pageToken => throw _privateConstructorUsedError;
  List<Message>? get messages => throw _privateConstructorUsedError;
  bool get navigateToDetailPage => throw _privateConstructorUsedError;

  /// Serializes this AuthorState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorStateCopyWith<AuthorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorStateCopyWith<$Res> {
  factory $AuthorStateCopyWith(
          AuthorState value, $Res Function(AuthorState) then) =
      _$AuthorStateCopyWithImpl<$Res, AuthorState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isShowSnackbar,
      bool isError,
      String? toastMessage,
      String? searchText,
      int? limit,
      String? pageToken,
      List<Message>? messages,
      bool navigateToDetailPage});
}

/// @nodoc
class _$AuthorStateCopyWithImpl<$Res, $Val extends AuthorState>
    implements $AuthorStateCopyWith<$Res> {
  _$AuthorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isShowSnackbar = null,
    Object? isError = null,
    Object? toastMessage = freezed,
    Object? searchText = freezed,
    Object? limit = freezed,
    Object? pageToken = freezed,
    Object? messages = freezed,
    Object? navigateToDetailPage = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowSnackbar: null == isShowSnackbar
          ? _value.isShowSnackbar
          : isShowSnackbar // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      toastMessage: freezed == toastMessage
          ? _value.toastMessage
          : toastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      pageToken: freezed == pageToken
          ? _value.pageToken
          : pageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      navigateToDetailPage: null == navigateToDetailPage
          ? _value.navigateToDetailPage
          : navigateToDetailPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorStateImplCopyWith<$Res>
    implements $AuthorStateCopyWith<$Res> {
  factory _$$AuthorStateImplCopyWith(
          _$AuthorStateImpl value, $Res Function(_$AuthorStateImpl) then) =
      __$$AuthorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isShowSnackbar,
      bool isError,
      String? toastMessage,
      String? searchText,
      int? limit,
      String? pageToken,
      List<Message>? messages,
      bool navigateToDetailPage});
}

/// @nodoc
class __$$AuthorStateImplCopyWithImpl<$Res>
    extends _$AuthorStateCopyWithImpl<$Res, _$AuthorStateImpl>
    implements _$$AuthorStateImplCopyWith<$Res> {
  __$$AuthorStateImplCopyWithImpl(
      _$AuthorStateImpl _value, $Res Function(_$AuthorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isShowSnackbar = null,
    Object? isError = null,
    Object? toastMessage = freezed,
    Object? searchText = freezed,
    Object? limit = freezed,
    Object? pageToken = freezed,
    Object? messages = freezed,
    Object? navigateToDetailPage = null,
  }) {
    return _then(_$AuthorStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowSnackbar: null == isShowSnackbar
          ? _value.isShowSnackbar
          : isShowSnackbar // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      toastMessage: freezed == toastMessage
          ? _value.toastMessage
          : toastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      pageToken: freezed == pageToken
          ? _value.pageToken
          : pageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      navigateToDetailPage: null == navigateToDetailPage
          ? _value.navigateToDetailPage
          : navigateToDetailPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorStateImpl extends _AuthorState {
  const _$AuthorStateImpl(
      {this.isLoading = false,
      this.isShowSnackbar = false,
      this.isError = false,
      this.toastMessage,
      this.searchText,
      this.limit,
      this.pageToken,
      final List<Message>? messages,
      this.navigateToDetailPage = false})
      : _messages = messages,
        super._();

  factory _$AuthorStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isShowSnackbar;
  @override
  @JsonKey()
  final bool isError;
  @override
  final String? toastMessage;
  @override
  final String? searchText;
  @override
  final int? limit;
  @override
  final String? pageToken;
  final List<Message>? _messages;
  @override
  List<Message>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool navigateToDetailPage;

  @override
  String toString() {
    return 'AuthorState(isLoading: $isLoading, isShowSnackbar: $isShowSnackbar, isError: $isError, toastMessage: $toastMessage, searchText: $searchText, limit: $limit, pageToken: $pageToken, messages: $messages, navigateToDetailPage: $navigateToDetailPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isShowSnackbar, isShowSnackbar) ||
                other.isShowSnackbar == isShowSnackbar) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.toastMessage, toastMessage) ||
                other.toastMessage == toastMessage) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pageToken, pageToken) ||
                other.pageToken == pageToken) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.navigateToDetailPage, navigateToDetailPage) ||
                other.navigateToDetailPage == navigateToDetailPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isShowSnackbar,
      isError,
      toastMessage,
      searchText,
      limit,
      pageToken,
      const DeepCollectionEquality().hash(_messages),
      navigateToDetailPage);

  /// Create a copy of AuthorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorStateImplCopyWith<_$AuthorStateImpl> get copyWith =>
      __$$AuthorStateImplCopyWithImpl<_$AuthorStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorStateImplToJson(
      this,
    );
  }
}

abstract class _AuthorState extends AuthorState {
  const factory _AuthorState(
      {final bool isLoading,
      final bool isShowSnackbar,
      final bool isError,
      final String? toastMessage,
      final String? searchText,
      final int? limit,
      final String? pageToken,
      final List<Message>? messages,
      final bool navigateToDetailPage}) = _$AuthorStateImpl;
  const _AuthorState._() : super._();

  factory _AuthorState.fromJson(Map<String, dynamic> json) =
      _$AuthorStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get isShowSnackbar;
  @override
  bool get isError;
  @override
  String? get toastMessage;
  @override
  String? get searchText;
  @override
  int? get limit;
  @override
  String? get pageToken;
  @override
  List<Message>? get messages;
  @override
  bool get navigateToDetailPage;

  /// Create a copy of AuthorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorStateImplCopyWith<_$AuthorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
