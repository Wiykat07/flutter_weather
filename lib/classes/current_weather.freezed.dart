// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  return _CurrentWeather.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeather {
  List<WeatherForecast>? get days => throw _privateConstructorUsedError;
  WeatherForecast? get current =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'resolvedAddress')
  String? get location => throw _privateConstructorUsedError;
  List<Alert>? get alerts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentWeatherCopyWith<CurrentWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherCopyWith<$Res> {
  factory $CurrentWeatherCopyWith(
          CurrentWeather value, $Res Function(CurrentWeather) then) =
      _$CurrentWeatherCopyWithImpl<$Res, CurrentWeather>;
  @useResult
  $Res call(
      {List<WeatherForecast>? days,
      WeatherForecast? current,
      @JsonKey(name: 'resolvedAddress') String? location,
      List<Alert>? alerts});

  $WeatherForecastCopyWith<$Res>? get current;
}

/// @nodoc
class _$CurrentWeatherCopyWithImpl<$Res, $Val extends CurrentWeather>
    implements $CurrentWeatherCopyWith<$Res> {
  _$CurrentWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = freezed,
    Object? current = freezed,
    Object? location = freezed,
    Object? alerts = freezed,
  }) {
    return _then(_value.copyWith(
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<WeatherForecast>?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      alerts: freezed == alerts
          ? _value.alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<Alert>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get current {
    if (_value.current == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_value.current!, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CurrentWeatherCopyWith<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  factory _$$_CurrentWeatherCopyWith(
          _$_CurrentWeather value, $Res Function(_$_CurrentWeather) then) =
      __$$_CurrentWeatherCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WeatherForecast>? days,
      WeatherForecast? current,
      @JsonKey(name: 'resolvedAddress') String? location,
      List<Alert>? alerts});

  @override
  $WeatherForecastCopyWith<$Res>? get current;
}

/// @nodoc
class __$$_CurrentWeatherCopyWithImpl<$Res>
    extends _$CurrentWeatherCopyWithImpl<$Res, _$_CurrentWeather>
    implements _$$_CurrentWeatherCopyWith<$Res> {
  __$$_CurrentWeatherCopyWithImpl(
      _$_CurrentWeather _value, $Res Function(_$_CurrentWeather) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = freezed,
    Object? current = freezed,
    Object? location = freezed,
    Object? alerts = freezed,
  }) {
    return _then(_$_CurrentWeather(
      days: freezed == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<WeatherForecast>?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      alerts: freezed == alerts
          ? _value._alerts
          : alerts // ignore: cast_nullable_to_non_nullable
              as List<Alert>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrentWeather implements _CurrentWeather {
  const _$_CurrentWeather(
      {final List<WeatherForecast>? days,
      this.current,
      @JsonKey(name: 'resolvedAddress') this.location,
      final List<Alert>? alerts})
      : _days = days,
        _alerts = alerts;

  factory _$_CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentWeatherFromJson(json);

  final List<WeatherForecast>? _days;
  @override
  List<WeatherForecast>? get days {
    final value = _days;
    if (value == null) return null;
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final WeatherForecast? current;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'resolvedAddress')
  final String? location;
  final List<Alert>? _alerts;
  @override
  List<Alert>? get alerts {
    final value = _alerts;
    if (value == null) return null;
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurrentWeather(days: $days, current: $current, location: $location, alerts: $alerts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentWeather &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_days),
      current,
      location,
      const DeepCollectionEquality().hash(_alerts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentWeatherCopyWith<_$_CurrentWeather> get copyWith =>
      __$$_CurrentWeatherCopyWithImpl<_$_CurrentWeather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentWeatherToJson(
      this,
    );
  }
}

abstract class _CurrentWeather implements CurrentWeather {
  const factory _CurrentWeather(
      {final List<WeatherForecast>? days,
      final WeatherForecast? current,
      @JsonKey(name: 'resolvedAddress') final String? location,
      final List<Alert>? alerts}) = _$_CurrentWeather;

  factory _CurrentWeather.fromJson(Map<String, dynamic> json) =
      _$_CurrentWeather.fromJson;

  @override
  List<WeatherForecast>? get days;
  @override
  WeatherForecast? get current;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'resolvedAddress')
  String? get location;
  @override
  List<Alert>? get alerts;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentWeatherCopyWith<_$_CurrentWeather> get copyWith =>
      throw _privateConstructorUsedError;
}
