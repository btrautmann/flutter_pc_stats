// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hardware_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServerConnection {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HubConnection connection) connected,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HubConnection connection)? connected,
    TResult? Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HubConnection connection)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConnectionCopyWith<$Res> {
  factory $ServerConnectionCopyWith(
          ServerConnection value, $Res Function(ServerConnection) then) =
      _$ServerConnectionCopyWithImpl<$Res, ServerConnection>;
}

/// @nodoc
class _$ServerConnectionCopyWithImpl<$Res, $Val extends ServerConnection>
    implements $ServerConnectionCopyWith<$Res> {
  _$ServerConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ConnectedCopyWith<$Res> {
  factory _$$_ConnectedCopyWith(
          _$_Connected value, $Res Function(_$_Connected) then) =
      __$$_ConnectedCopyWithImpl<$Res>;
  @useResult
  $Res call({HubConnection connection});
}

/// @nodoc
class __$$_ConnectedCopyWithImpl<$Res>
    extends _$ServerConnectionCopyWithImpl<$Res, _$_Connected>
    implements _$$_ConnectedCopyWith<$Res> {
  __$$_ConnectedCopyWithImpl(
      _$_Connected _value, $Res Function(_$_Connected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connection = null,
  }) {
    return _then(_$_Connected(
      null == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as HubConnection,
    ));
  }
}

/// @nodoc

class _$_Connected implements _Connected {
  _$_Connected(this.connection);

  @override
  final HubConnection connection;

  @override
  String toString() {
    return 'ServerConnection.connected(connection: $connection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Connected &&
            (identical(other.connection, connection) ||
                other.connection == connection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectedCopyWith<_$_Connected> get copyWith =>
      __$$_ConnectedCopyWithImpl<_$_Connected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HubConnection connection) connected,
    required TResult Function() disconnected,
  }) {
    return connected(connection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HubConnection connection)? connected,
    TResult? Function()? disconnected,
  }) {
    return connected?.call(connection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HubConnection connection)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(connection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements ServerConnection {
  factory _Connected(final HubConnection connection) = _$_Connected;

  HubConnection get connection;
  @JsonKey(ignore: true)
  _$$_ConnectedCopyWith<_$_Connected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DisconnectedCopyWith<$Res> {
  factory _$$_DisconnectedCopyWith(
          _$_Disconnected value, $Res Function(_$_Disconnected) then) =
      __$$_DisconnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisconnectedCopyWithImpl<$Res>
    extends _$ServerConnectionCopyWithImpl<$Res, _$_Disconnected>
    implements _$$_DisconnectedCopyWith<$Res> {
  __$$_DisconnectedCopyWithImpl(
      _$_Disconnected _value, $Res Function(_$_Disconnected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Disconnected implements _Disconnected {
  _$_Disconnected();

  @override
  String toString() {
    return 'ServerConnection.disconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Disconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HubConnection connection) connected,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HubConnection connection)? connected,
    TResult? Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HubConnection connection)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connected value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connected value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements ServerConnection {
  factory _Disconnected() = _$_Disconnected;
}

/// @nodoc
mixin _$HardwareSummary {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(Cpu cpu, List<Gpu> gpus) available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unavailable,
    TResult? Function(Cpu cpu, List<Gpu> gpus)? available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(Cpu cpu, List<Gpu> gpus)? available,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Available value) available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Available value)? available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HardwareSummaryCopyWith<$Res> {
  factory $HardwareSummaryCopyWith(
          HardwareSummary value, $Res Function(HardwareSummary) then) =
      _$HardwareSummaryCopyWithImpl<$Res, HardwareSummary>;
}

/// @nodoc
class _$HardwareSummaryCopyWithImpl<$Res, $Val extends HardwareSummary>
    implements $HardwareSummaryCopyWith<$Res> {
  _$HardwareSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnavailableCopyWith<$Res> {
  factory _$$_UnavailableCopyWith(
          _$_Unavailable value, $Res Function(_$_Unavailable) then) =
      __$$_UnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnavailableCopyWithImpl<$Res>
    extends _$HardwareSummaryCopyWithImpl<$Res, _$_Unavailable>
    implements _$$_UnavailableCopyWith<$Res> {
  __$$_UnavailableCopyWithImpl(
      _$_Unavailable _value, $Res Function(_$_Unavailable) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unavailable implements _Unavailable {
  _$_Unavailable();

  @override
  String toString() {
    return 'HardwareSummary.unavailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(Cpu cpu, List<Gpu> gpus) available,
  }) {
    return unavailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unavailable,
    TResult? Function(Cpu cpu, List<Gpu> gpus)? available,
  }) {
    return unavailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(Cpu cpu, List<Gpu> gpus)? available,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Available value) available,
  }) {
    return unavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Available value)? available,
  }) {
    return unavailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (unavailable != null) {
      return unavailable(this);
    }
    return orElse();
  }
}

abstract class _Unavailable implements HardwareSummary {
  factory _Unavailable() = _$_Unavailable;
}

/// @nodoc
abstract class _$$_AvailableCopyWith<$Res> {
  factory _$$_AvailableCopyWith(
          _$_Available value, $Res Function(_$_Available) then) =
      __$$_AvailableCopyWithImpl<$Res>;
  @useResult
  $Res call({Cpu cpu, List<Gpu> gpus});
}

/// @nodoc
class __$$_AvailableCopyWithImpl<$Res>
    extends _$HardwareSummaryCopyWithImpl<$Res, _$_Available>
    implements _$$_AvailableCopyWith<$Res> {
  __$$_AvailableCopyWithImpl(
      _$_Available _value, $Res Function(_$_Available) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cpu = null,
    Object? gpus = null,
  }) {
    return _then(_$_Available(
      cpu: null == cpu
          ? _value.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as Cpu,
      gpus: null == gpus
          ? _value._gpus
          : gpus // ignore: cast_nullable_to_non_nullable
              as List<Gpu>,
    ));
  }
}

/// @nodoc

class _$_Available implements _Available {
  _$_Available({required this.cpu, required final List<Gpu> gpus})
      : _gpus = gpus;

  @override
  final Cpu cpu;
  final List<Gpu> _gpus;
  @override
  List<Gpu> get gpus {
    if (_gpus is EqualUnmodifiableListView) return _gpus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gpus);
  }

  @override
  String toString() {
    return 'HardwareSummary.available(cpu: $cpu, gpus: $gpus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Available &&
            (identical(other.cpu, cpu) || other.cpu == cpu) &&
            const DeepCollectionEquality().equals(other._gpus, _gpus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cpu, const DeepCollectionEquality().hash(_gpus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableCopyWith<_$_Available> get copyWith =>
      __$$_AvailableCopyWithImpl<_$_Available>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unavailable,
    required TResult Function(Cpu cpu, List<Gpu> gpus) available,
  }) {
    return available(cpu, gpus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unavailable,
    TResult? Function(Cpu cpu, List<Gpu> gpus)? available,
  }) {
    return available?.call(cpu, gpus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unavailable,
    TResult Function(Cpu cpu, List<Gpu> gpus)? available,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(cpu, gpus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unavailable value) unavailable,
    required TResult Function(_Available value) available,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unavailable value)? unavailable,
    TResult? Function(_Available value)? available,
  }) {
    return available?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unavailable value)? unavailable,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available implements HardwareSummary {
  factory _Available({required final Cpu cpu, required final List<Gpu> gpus}) =
      _$_Available;

  Cpu get cpu;
  List<Gpu> get gpus;
  @JsonKey(ignore: true)
  _$$_AvailableCopyWith<_$_Available> get copyWith =>
      throw _privateConstructorUsedError;
}
