// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_width.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StrokeWidthChangeEvent extends StrokeWidthChangeEvent {
  @override
  final double width;

  factory _$StrokeWidthChangeEvent(
          [void Function(StrokeWidthChangeEventBuilder)? updates]) =>
      (new StrokeWidthChangeEventBuilder()..update(updates)).build();

  _$StrokeWidthChangeEvent._({required this.width}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        width, 'StrokeWidthChangeEvent', 'width');
  }

  @override
  StrokeWidthChangeEvent rebuild(
          void Function(StrokeWidthChangeEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StrokeWidthChangeEventBuilder toBuilder() =>
      new StrokeWidthChangeEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StrokeWidthChangeEvent && width == other.width;
  }

  @override
  int get hashCode {
    return $jf($jc(0, width.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StrokeWidthChangeEvent')
          ..add('width', width))
        .toString();
  }
}

class StrokeWidthChangeEventBuilder
    implements Builder<StrokeWidthChangeEvent, StrokeWidthChangeEventBuilder> {
  _$StrokeWidthChangeEvent? _$v;

  double? _width;
  double? get width => _$this._width;
  set width(double? width) => _$this._width = width;

  StrokeWidthChangeEventBuilder();

  StrokeWidthChangeEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _width = $v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StrokeWidthChangeEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StrokeWidthChangeEvent;
  }

  @override
  void update(void Function(StrokeWidthChangeEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StrokeWidthChangeEvent build() {
    final _$result = _$v ??
        new _$StrokeWidthChangeEvent._(
            width: BuiltValueNullFieldError.checkNotNull(
                width, 'StrokeWidthChangeEvent', 'width'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
