// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Stroke extends Stroke {
  @override
  final BuiltList<TouchLocationEvent> locations;
  @override
  final double strokeWidth;
  @override
  final ColorChangeEvent color;

  factory _$Stroke([void Function(StrokeBuilder)? updates]) =>
      (new StrokeBuilder()..update(updates)).build();

  _$Stroke._(
      {required this.locations, required this.strokeWidth, required this.color})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(locations, 'Stroke', 'locations');
    BuiltValueNullFieldError.checkNotNull(strokeWidth, 'Stroke', 'strokeWidth');
    BuiltValueNullFieldError.checkNotNull(color, 'Stroke', 'color');
  }

  @override
  Stroke rebuild(void Function(StrokeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StrokeBuilder toBuilder() => new StrokeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stroke &&
        locations == other.locations &&
        strokeWidth == other.strokeWidth &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, locations.hashCode), strokeWidth.hashCode), color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Stroke')
          ..add('locations', locations)
          ..add('strokeWidth', strokeWidth)
          ..add('color', color))
        .toString();
  }
}

class StrokeBuilder implements Builder<Stroke, StrokeBuilder> {
  _$Stroke? _$v;

  ListBuilder<TouchLocationEvent>? _locations;
  ListBuilder<TouchLocationEvent> get locations =>
      _$this._locations ??= new ListBuilder<TouchLocationEvent>();
  set locations(ListBuilder<TouchLocationEvent>? locations) =>
      _$this._locations = locations;

  double? _strokeWidth;
  double? get strokeWidth => _$this._strokeWidth;
  set strokeWidth(double? strokeWidth) => _$this._strokeWidth = strokeWidth;

  ColorChangeEventBuilder? _color;
  ColorChangeEventBuilder get color =>
      _$this._color ??= new ColorChangeEventBuilder();
  set color(ColorChangeEventBuilder? color) => _$this._color = color;

  StrokeBuilder();

  StrokeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locations = $v.locations.toBuilder();
      _strokeWidth = $v.strokeWidth;
      _color = $v.color.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Stroke other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Stroke;
  }

  @override
  void update(void Function(StrokeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Stroke build() {
    _$Stroke _$result;
    try {
      _$result = _$v ??
          new _$Stroke._(
              locations: locations.build(),
              strokeWidth: BuiltValueNullFieldError.checkNotNull(
                  strokeWidth, 'Stroke', 'strokeWidth'),
              color: color.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'locations';
        locations.build();

        _$failedField = 'color';
        color.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Stroke', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
