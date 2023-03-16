import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'family_record.g.dart';

abstract class FamilyRecord
    implements Built<FamilyRecord, FamilyRecordBuilder> {
  static Serializer<FamilyRecord> get serializer => _$familyRecordSerializer;

  String? get childFirstName;

  String? get childLastName;

  String? get childIconImage;

  String? get childTopImage;

  DocumentReference? get parentAccount;

  DateTime? get yearBorn;

  String? get gender;

  double? get poids;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FamilyRecordBuilder builder) => builder
    ..childFirstName = ''
    ..childLastName = ''
    ..childIconImage = ''
    ..childTopImage = ''
    ..gender = ''
    ..poids = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('family');

  static Stream<FamilyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FamilyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FamilyRecord._();
  factory FamilyRecord([void Function(FamilyRecordBuilder) updates]) =
      _$FamilyRecord;

  static FamilyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFamilyRecordData({
  String? childFirstName,
  String? childLastName,
  String? childIconImage,
  String? childTopImage,
  DocumentReference? parentAccount,
  DateTime? yearBorn,
  String? gender,
  double? poids,
}) {
  final firestoreData = serializers.toFirestore(
    FamilyRecord.serializer,
    FamilyRecord(
      (f) => f
        ..childFirstName = childFirstName
        ..childLastName = childLastName
        ..childIconImage = childIconImage
        ..childTopImage = childTopImage
        ..parentAccount = parentAccount
        ..yearBorn = yearBorn
        ..gender = gender
        ..poids = poids,
    ),
  );

  return firestoreData;
}
