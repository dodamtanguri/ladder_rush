// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ladder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Ladder {
  List<List<int>> get route => throw _privateConstructorUsedError;

  /// Create a copy of Ladder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LadderCopyWith<Ladder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LadderCopyWith<$Res> {
  factory $LadderCopyWith(Ladder value, $Res Function(Ladder) then) =
      _$LadderCopyWithImpl<$Res, Ladder>;
  @useResult
  $Res call({List<List<int>> route});
}

/// @nodoc
class _$LadderCopyWithImpl<$Res, $Val extends Ladder>
    implements $LadderCopyWith<$Res> {
  _$LadderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ladder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<List<int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LadderImplCopyWith<$Res> implements $LadderCopyWith<$Res> {
  factory _$$LadderImplCopyWith(
          _$LadderImpl value, $Res Function(_$LadderImpl) then) =
      __$$LadderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<int>> route});
}

/// @nodoc
class __$$LadderImplCopyWithImpl<$Res>
    extends _$LadderCopyWithImpl<$Res, _$LadderImpl>
    implements _$$LadderImplCopyWith<$Res> {
  __$$LadderImplCopyWithImpl(
      _$LadderImpl _value, $Res Function(_$LadderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ladder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_$LadderImpl(
      route: null == route
          ? _value._route
          : route // ignore: cast_nullable_to_non_nullable
              as List<List<int>>,
    ));
  }
}

/// @nodoc

class _$LadderImpl implements _Ladder {
  const _$LadderImpl({required final List<List<int>> route}) : _route = route;

  final List<List<int>> _route;
  @override
  List<List<int>> get route {
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_route);
  }

  @override
  String toString() {
    return 'Ladder(route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LadderImpl &&
            const DeepCollectionEquality().equals(other._route, _route));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_route));

  /// Create a copy of Ladder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LadderImplCopyWith<_$LadderImpl> get copyWith =>
      __$$LadderImplCopyWithImpl<_$LadderImpl>(this, _$identity);
}

abstract class _Ladder implements Ladder {
  const factory _Ladder({required final List<List<int>> route}) = _$LadderImpl;

  @override
  List<List<int>> get route;

  /// Create a copy of Ladder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LadderImplCopyWith<_$LadderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
