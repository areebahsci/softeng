import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'games_record.g.dart';

abstract class GamesRecord implements Built<GamesRecord, GamesRecordBuilder> {
  static Serializer<GamesRecord> get serializer => _$gamesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'game_title')
  String get gameTitle;

  @nullable
  String get location;

  @nullable
  @BuiltValueField(wireName: 'location_image')
  String get locationImage;

  @nullable
  String get host;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'max_players')
  int get maxPlayers;

  @nullable
  @BuiltValueField(wireName: 'ID')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'Date')
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'Time')
  String get time;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GamesRecordBuilder builder) => builder
    ..gameTitle = ''
    ..location = ''
    ..locationImage = ''
    ..host = ''
    ..description = ''
    ..maxPlayers = 0
    ..id = 0
    ..time = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GamesRecord._();
  factory GamesRecord([void Function(GamesRecordBuilder) updates]) =
      _$GamesRecord;

  static GamesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGamesRecordData({
  String gameTitle,
  String location,
  String locationImage,
  String host,
  String description,
  int maxPlayers,
  int id,
  DateTime date,
  String time,
}) =>
    serializers.toFirestore(
        GamesRecord.serializer,
        GamesRecord((g) => g
          ..gameTitle = gameTitle
          ..location = location
          ..locationImage = locationImage
          ..host = host
          ..description = description
          ..maxPlayers = maxPlayers
          ..id = id
          ..date = date
          ..time = time));
