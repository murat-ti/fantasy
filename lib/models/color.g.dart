// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ColorChangeEvent extends ColorChangeEvent {
  @override
  final int red;
  @override
  final int green;
  @override
  final int blue;

  factory _$ColorChangeEvent(
          [void Function(ColorChangeEventBuilder)? updates]) =>
      (new ColorChangeEventBuilder()..update(updates)).build();

  _$ColorChangeEvent._(
      {required this.red, required this.green, required this.blue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(red, 'ColorChangeEvent', 'red');
    BuiltValueNullFieldError.checkNotNull(green, 'ColorChangeEvent', 'green');
    BuiltValueNullFieldError.checkNotNull(blue, 'ColorChangeEvent', 'blue');
  }

  @override
  ColorChangeEvent rebuild(void Function(ColorChangeEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ColorChangeEventBuilder toBuilder() =>
      new ColorChangeEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ColorChangeEvent &&
        red == other.red &&
        green == other.green &&
        blue == other.blue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, red.hashCode), green.hashCode), blue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ColorChangeEvent')
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class ColorChangeEventBuilder
    implements Builder<ColorChangeEvent, ColorChangeEventBuilder> {
  _$ColorChangeEvent? _$v;

  int? _red;
  int? get red => _$this._red;
  set red(int? red) => _$this._red = red;

  int? _green;
  int? get green => _$this._green;
  set green(int? green) => _$this._green = green;

  int? _blue;
  int? get blue => _$this._blue;
  set blue(int? blue) => _$this._blue = blue;

  ColorChangeEventBuilder();

  ColorChangeEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _red = $v.red;
      _green = $v.green;
      _blue = $v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ColorChangeEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ColorChangeEvent;
  }

  @override
  void update(void Function(ColorChangeEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ColorChangeEvent build() {
    final _$result = _$v ??
        new _$ColorChangeEvent._(
            red: BuiltValueNullFieldError.checkNotNull(
                red, 'ColorChangeEvent', 'red'),
            green: BuiltValueNullFieldError.checkNotNull(
                green, 'ColorChangeEvent', 'green'),
            blue: BuiltValueNullFieldError.checkNotNull(
                blue, 'ColorChangeEvent', 'blue'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
