import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'post_comments_record.g.dart';

abstract class PostCommentsRecord
    implements Built<PostCommentsRecord, PostCommentsRecordBuilder> {
  static Serializer<PostCommentsRecord> get serializer =>
      _$postCommentsRecordSerializer;

  DocumentReference? get by;

  String? get comment;

  DateTime? get addedDate;

  DocumentReference? get postId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PostCommentsRecordBuilder builder) =>
      builder..comment = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postComments')
          : FirebaseFirestore.instance.collectionGroup('postComments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('postComments').doc();

  static Stream<PostCommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostCommentsRecord._();
  factory PostCommentsRecord(
          [void Function(PostCommentsRecordBuilder) updates]) =
      _$PostCommentsRecord;

  static PostCommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostCommentsRecordData({
  DocumentReference? by,
  String? comment,
  DateTime? addedDate,
  DocumentReference? postId,
}) {
  final firestoreData = serializers.toFirestore(
    PostCommentsRecord.serializer,
    PostCommentsRecord(
      (p) => p
        ..by = by
        ..comment = comment
        ..addedDate = addedDate
        ..postId = postId,
    ),
  );

  return firestoreData;
}
