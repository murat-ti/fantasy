// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touch_location.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TouchLocationEvent extends TouchLocationEvent {
  @override
  final double x;
  @override
  final double y;

  factory _$TouchLocationEvent(
          [void Function(TouchLocationEventBuilder)? updates]) =>
      (new TouchLocationEventBuilder()..update(updates)).build();

  _$TouchLocationEvent._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, 'TouchLocationEvent', 'x');
    BuiltValueNullFieldError.checkNotNull(y, 'TouchLocationEvent', 'y');
  }

  @override
  TouchLocationEvent rebuild(
          void Function(TouchLocationEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TouchLocationEventBuilder toBuilder() =>
      new TouchLocationEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TouchLocationEvent && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, x.hashCode), y.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TouchLocationEvent')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class TouchLocationEventBuilder
    implements Builder<TouchLocationEvent, TouchLocationEventBuilder> {
  _$TouchLocationEvent? _$v;

  double? _x;
  double? get x => _$this._x;
  set x(double? x) => _$this._x = x;

  double? _y;
  double? get y => _$this._y;
  set y(double? y) => _$this._y = y;

  TouchLocationEventBuilder();

  TouchLocationEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TouchLocationEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TouchLocationEvent;
  }

  @override
  void update(void Function(TouchLocationEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TouchLocationEvent build() {
    final _$result = _$v ??
        new _$TouchLocationEvent._(
            x: BuiltValueNullFieldError.checkNotNull(
                x, 'TouchLocationEvent', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(
                y, 'TouchLocationEvent', 'y'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
