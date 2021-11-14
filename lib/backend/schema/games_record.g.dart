// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GamesRecord> _$gamesRecordSerializer = new _$GamesRecordSerializer();

class _$GamesRecordSerializer implements StructuredSerializer<GamesRecord> {
  @override
  final Iterable<Type> types = const [GamesRecord, _$GamesRecord];
  @override
  final String wireName = 'GamesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, GamesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.gameTitle;
    if (value != null) {
      result
        ..add('game_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationImage;
    if (value != null) {
      result
        ..add('location_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.host;
    if (value != null) {
      result
        ..add('host')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maxPlayers;
    if (value != null) {
      result
        ..add('max_players')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('ID')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('Date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('Time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.currentPlayers;
    if (value != null) {
      result
        ..add('currentPlayers')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.currentPlayersList;
    if (value != null) {
      result
        ..add('currentPlayersList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.gameIsOver;
    if (value != null) {
      result
        ..add('GameIsOver')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.geolocation;
    if (value != null) {
      result
        ..add('geolocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.gameType;
    if (value != null) {
      result
        ..add('gameType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  GamesRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GamesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'game_title':
          result.gameTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location_image':
          result.locationImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'host':
          result.host = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'max_players':
          result.maxPlayers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ID':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'currentPlayers':
          result.currentPlayers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'currentPlayersList':
          result.currentPlayersList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'GameIsOver':
          result.gameIsOver = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'geolocation':
          result.geolocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'gameType':
          result.gameType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$GamesRecord extends GamesRecord {
  @override
  final String gameTitle;
  @override
  final String location;
  @override
  final String locationImage;
  @override
  final String host;
  @override
  final String description;
  @override
  final int maxPlayers;
  @override
  final int id;
  @override
  final DateTime date;
  @override
  final String time;
  @override
  final int currentPlayers;
  @override
  final BuiltList<DocumentReference<Object>> currentPlayersList;
  @override
  final int gameIsOver;
  @override
  final LatLng geolocation;
  @override
  final String gameType;
  @override
  final DocumentReference<Object> reference;

  factory _$GamesRecord([void Function(GamesRecordBuilder) updates]) =>
      (new GamesRecordBuilder()..update(updates)).build();

  _$GamesRecord._(
      {this.gameTitle,
      this.location,
      this.locationImage,
      this.host,
      this.description,
      this.maxPlayers,
      this.id,
      this.date,
      this.time,
      this.currentPlayers,
      this.currentPlayersList,
      this.gameIsOver,
      this.geolocation,
      this.gameType,
      this.reference})
      : super._();

  @override
  GamesRecord rebuild(void Function(GamesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GamesRecordBuilder toBuilder() => new GamesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GamesRecord &&
        gameTitle == other.gameTitle &&
        location == other.location &&
        locationImage == other.locationImage &&
        host == other.host &&
        description == other.description &&
        maxPlayers == other.maxPlayers &&
        id == other.id &&
        date == other.date &&
        time == other.time &&
        currentPlayers == other.currentPlayers &&
        currentPlayersList == other.currentPlayersList &&
        gameIsOver == other.gameIsOver &&
        geolocation == other.geolocation &&
        gameType == other.gameType &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                gameTitle
                                                                    .hashCode),
                                                            location.hashCode),
                                                        locationImage.hashCode),
                                                    host.hashCode),
                                                description.hashCode),
                                            maxPlayers.hashCode),
                                        id.hashCode),
                                    date.hashCode),
                                time.hashCode),
                            currentPlayers.hashCode),
                        currentPlayersList.hashCode),
                    gameIsOver.hashCode),
                geolocation.hashCode),
            gameType.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GamesRecord')
          ..add('gameTitle', gameTitle)
          ..add('location', location)
          ..add('locationImage', locationImage)
          ..add('host', host)
          ..add('description', description)
          ..add('maxPlayers', maxPlayers)
          ..add('id', id)
          ..add('date', date)
          ..add('time', time)
          ..add('currentPlayers', currentPlayers)
          ..add('currentPlayersList', currentPlayersList)
          ..add('gameIsOver', gameIsOver)
          ..add('geolocation', geolocation)
          ..add('gameType', gameType)
          ..add('reference', reference))
        .toString();
  }
}

class GamesRecordBuilder implements Builder<GamesRecord, GamesRecordBuilder> {
  _$GamesRecord _$v;

  String _gameTitle;
  String get gameTitle => _$this._gameTitle;
  set gameTitle(String gameTitle) => _$this._gameTitle = gameTitle;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  String _locationImage;
  String get locationImage => _$this._locationImage;
  set locationImage(String locationImage) =>
      _$this._locationImage = locationImage;

  String _host;
  String get host => _$this._host;
  set host(String host) => _$this._host = host;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _maxPlayers;
  int get maxPlayers => _$this._maxPlayers;
  set maxPlayers(int maxPlayers) => _$this._maxPlayers = maxPlayers;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  int _currentPlayers;
  int get currentPlayers => _$this._currentPlayers;
  set currentPlayers(int currentPlayers) =>
      _$this._currentPlayers = currentPlayers;

  ListBuilder<DocumentReference<Object>> _currentPlayersList;
  ListBuilder<DocumentReference<Object>> get currentPlayersList =>
      _$this._currentPlayersList ??=
          new ListBuilder<DocumentReference<Object>>();
  set currentPlayersList(
          ListBuilder<DocumentReference<Object>> currentPlayersList) =>
      _$this._currentPlayersList = currentPlayersList;

  int _gameIsOver;
  int get gameIsOver => _$this._gameIsOver;
  set gameIsOver(int gameIsOver) => _$this._gameIsOver = gameIsOver;

  LatLng _geolocation;
  LatLng get geolocation => _$this._geolocation;
  set geolocation(LatLng geolocation) => _$this._geolocation = geolocation;

  String _gameType;
  String get gameType => _$this._gameType;
  set gameType(String gameType) => _$this._gameType = gameType;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  GamesRecordBuilder() {
    GamesRecord._initializeBuilder(this);
  }

  GamesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gameTitle = $v.gameTitle;
      _location = $v.location;
      _locationImage = $v.locationImage;
      _host = $v.host;
      _description = $v.description;
      _maxPlayers = $v.maxPlayers;
      _id = $v.id;
      _date = $v.date;
      _time = $v.time;
      _currentPlayers = $v.currentPlayers;
      _currentPlayersList = $v.currentPlayersList?.toBuilder();
      _gameIsOver = $v.gameIsOver;
      _geolocation = $v.geolocation;
      _gameType = $v.gameType;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GamesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GamesRecord;
  }

  @override
  void update(void Function(GamesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GamesRecord build() {
    _$GamesRecord _$result;
    try {
      _$result = _$v ??
          new _$GamesRecord._(
              gameTitle: gameTitle,
              location: location,
              locationImage: locationImage,
              host: host,
              description: description,
              maxPlayers: maxPlayers,
              id: id,
              date: date,
              time: time,
              currentPlayers: currentPlayers,
              currentPlayersList: _currentPlayersList?.build(),
              gameIsOver: gameIsOver,
              geolocation: geolocation,
              gameType: gameType,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currentPlayersList';
        _currentPlayersList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GamesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
