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

/// @nodoc
mixin _$Point {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointImplCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$PointImplCopyWith(
          _$PointImpl value, $Res Function(_$PointImpl) then) =
      __$$PointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y});
}

/// @nodoc
class __$$PointImplCopyWithImpl<$Res>
    extends _$PointCopyWithImpl<$Res, _$PointImpl>
    implements _$$PointImplCopyWith<$Res> {
  __$$PointImplCopyWithImpl(
      _$PointImpl _value, $Res Function(_$PointImpl) _then)
      : super(_value, _then);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$PointImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PointImpl implements _Point {
  const _$PointImpl({required this.x, required this.y});

  @override
  final int x;
  @override
  final int y;

  @override
  String toString() {
    return 'Point(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      __$$PointImplCopyWithImpl<_$PointImpl>(this, _$identity);
}

abstract class _Point implements Point {
  const factory _Point({required final int x, required final int y}) =
      _$PointImpl;

  @override
  int get x;
  @override
  int get y;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Line {
  Point? get sx => throw _privateConstructorUsedError;
  Point? get ex => throw _privateConstructorUsedError;

  /// Create a copy of Line
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LineCopyWith<Line> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCopyWith<$Res> {
  factory $LineCopyWith(Line value, $Res Function(Line) then) =
      _$LineCopyWithImpl<$Res, Line>;
  @useResult
  $Res call({Point? sx, Point? ex});

  $PointCopyWith<$Res>? get sx;
  $PointCopyWith<$Res>? get ex;
}

/// @nodoc
class _$LineCopyWithImpl<$Res, $Val extends Line>
    implements $LineCopyWith<$Res> {
  _$LineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Line
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sx = freezed,
    Object? ex = freezed,
  }) {
    return _then(_value.copyWith(
      sx: freezed == sx
          ? _value.sx
          : sx // ignore: cast_nullable_to_non_nullable
              as Point?,
      ex: freezed == ex
          ? _value.ex
          : ex // ignore: cast_nullable_to_non_nullable
              as Point?,
    ) as $Val);
  }

  /// Create a copy of Line
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res>? get sx {
    if (_value.sx == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_value.sx!, (value) {
      return _then(_value.copyWith(sx: value) as $Val);
    });
  }

  /// Create a copy of Line
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res>? get ex {
    if (_value.ex == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_value.ex!, (value) {
      return _then(_value.copyWith(ex: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LineImplCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$$LineImplCopyWith(
          _$LineImpl value, $Res Function(_$LineImpl) then) =
      __$$LineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Point? sx, Point? ex});

  @override
  $PointCopyWith<$Res>? get sx;
  @override
  $PointCopyWith<$Res>? get ex;
}

/// @nodoc
class __$$LineImplCopyWithImpl<$Res>
    extends _$LineCopyWithImpl<$Res, _$LineImpl>
    implements _$$LineImplCopyWith<$Res> {
  __$$LineImplCopyWithImpl(_$LineImpl _value, $Res Function(_$LineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Line
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sx = freezed,
    Object? ex = freezed,
  }) {
    return _then(_$LineImpl(
      sx: freezed == sx
          ? _value.sx
          : sx // ignore: cast_nullable_to_non_nullable
              as Point?,
      ex: freezed == ex
          ? _value.ex
          : ex // ignore: cast_nullable_to_non_nullable
              as Point?,
    ));
  }
}

/// @nodoc

class _$LineImpl implements _Line {
  const _$LineImpl({this.sx, this.ex});

  @override
  final Point? sx;
  @override
  final Point? ex;

  @override
  String toString() {
    return 'Line(sx: $sx, ex: $ex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineImpl &&
            (identical(other.sx, sx) || other.sx == sx) &&
            (identical(other.ex, ex) || other.ex == ex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sx, ex);

  /// Create a copy of Line
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LineImplCopyWith<_$LineImpl> get copyWith =>
      __$$LineImplCopyWithImpl<_$LineImpl>(this, _$identity);
}

abstract class _Line implements Line {
  const factory _Line({final Point? sx, final Point? ex}) = _$LineImpl;

  @override
  Point? get sx;
  @override
  Point? get ex;

  /// Create a copy of Line
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LineImplCopyWith<_$LineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LadderEx {
  int get verticalCount => throw _privateConstructorUsedError;
  List<Line>? get lines => throw _privateConstructorUsedError;

  /// Create a copy of LadderEx
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LadderExCopyWith<LadderEx> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LadderExCopyWith<$Res> {
  factory $LadderExCopyWith(LadderEx value, $Res Function(LadderEx) then) =
      _$LadderExCopyWithImpl<$Res, LadderEx>;
  @useResult
  $Res call({int verticalCount, List<Line>? lines});
}

/// @nodoc
class _$LadderExCopyWithImpl<$Res, $Val extends LadderEx>
    implements $LadderExCopyWith<$Res> {
  _$LadderExCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LadderEx
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verticalCount = null,
    Object? lines = freezed,
  }) {
    return _then(_value.copyWith(
      verticalCount: null == verticalCount
          ? _value.verticalCount
          : verticalCount // ignore: cast_nullable_to_non_nullable
              as int,
      lines: freezed == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LadderExtImplCopyWith<$Res>
    implements $LadderExCopyWith<$Res> {
  factory _$$LadderExtImplCopyWith(
          _$LadderExtImpl value, $Res Function(_$LadderExtImpl) then) =
      __$$LadderExtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int verticalCount, List<Line>? lines});
}

/// @nodoc
class __$$LadderExtImplCopyWithImpl<$Res>
    extends _$LadderExCopyWithImpl<$Res, _$LadderExtImpl>
    implements _$$LadderExtImplCopyWith<$Res> {
  __$$LadderExtImplCopyWithImpl(
      _$LadderExtImpl _value, $Res Function(_$LadderExtImpl) _then)
      : super(_value, _then);

  /// Create a copy of LadderEx
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verticalCount = null,
    Object? lines = freezed,
  }) {
    return _then(_$LadderExtImpl(
      verticalCount: null == verticalCount
          ? _value.verticalCount
          : verticalCount // ignore: cast_nullable_to_non_nullable
              as int,
      lines: freezed == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>?,
    ));
  }
}

/// @nodoc

class _$LadderExtImpl implements _LadderExt {
  const _$LadderExtImpl({this.verticalCount = 5, final List<Line>? lines})
      : _lines = lines;

  @override
  @JsonKey()
  final int verticalCount;
  final List<Line>? _lines;
  @override
  List<Line>? get lines {
    final value = _lines;
    if (value == null) return null;
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LadderEx(verticalCount: $verticalCount, lines: $lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LadderExtImpl &&
            (identical(other.verticalCount, verticalCount) ||
                other.verticalCount == verticalCount) &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, verticalCount, const DeepCollectionEquality().hash(_lines));

  /// Create a copy of LadderEx
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LadderExtImplCopyWith<_$LadderExtImpl> get copyWith =>
      __$$LadderExtImplCopyWithImpl<_$LadderExtImpl>(this, _$identity);
}

abstract class _LadderExt implements LadderEx {
  const factory _LadderExt({final int verticalCount, final List<Line>? lines}) =
      _$LadderExtImpl;

  @override
  int get verticalCount;
  @override
  List<Line>? get lines;

  /// Create a copy of LadderEx
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LadderExtImplCopyWith<_$LadderExtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
