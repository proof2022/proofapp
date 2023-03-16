// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostCommentsRecord> _$postCommentsRecordSerializer =
    new _$PostCommentsRecordSerializer();

class _$PostCommentsRecordSerializer
    implements StructuredSerializer<PostCommentsRecord> {
  @override
  final Iterable<Type> types = const [PostCommentsRecord, _$PostCommentsRecord];
  @override
  final String wireName = 'PostCommentsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PostCommentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.by;
    if (value != null) {
      result
        ..add('by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addedDate;
    if (value != null) {
      result
        ..add('addedDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.postId;
    if (value != null) {
      result
        ..add('postId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PostCommentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostCommentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'addedDate':
          result.addedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'postId':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostCommentsRecord extends PostCommentsRecord {
  @override
  final DocumentReference<Object?>? by;
  @override
  final String? comment;
  @override
  final DateTime? addedDate;
  @override
  final DocumentReference<Object?>? postId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostCommentsRecord(
          [void Function(PostCommentsRecordBuilder)? updates]) =>
      (new PostCommentsRecordBuilder()..update(updates))._build();

  _$PostCommentsRecord._(
      {this.by, this.comment, this.addedDate, this.postId, this.ffRef})
      : super._();

  @override
  PostCommentsRecord rebuild(
          void Function(PostCommentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostCommentsRecordBuilder toBuilder() =>
      new PostCommentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostCommentsRecord &&
        by == other.by &&
        comment == other.comment &&
        addedDate == other.addedDate &&
        postId == other.postId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, by.hashCode), comment.hashCode), addedDate.hashCode),
            postId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostCommentsRecord')
          ..add('by', by)
          ..add('comment', comment)
          ..add('addedDate', addedDate)
          ..add('postId', postId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostCommentsRecordBuilder
    implements Builder<PostCommentsRecord, PostCommentsRecordBuilder> {
  _$PostCommentsRecord? _$v;

  DocumentReference<Object?>? _by;
  DocumentReference<Object?>? get by => _$this._by;
  set by(DocumentReference<Object?>? by) => _$this._by = by;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DateTime? _addedDate;
  DateTime? get addedDate => _$this._addedDate;
  set addedDate(DateTime? addedDate) => _$this._addedDate = addedDate;

  DocumentReference<Object?>? _postId;
  DocumentReference<Object?>? get postId => _$this._postId;
  set postId(DocumentReference<Object?>? postId) => _$this._postId = postId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostCommentsRecordBuilder() {
    PostCommentsRecord._initializeBuilder(this);
  }

  PostCommentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _by = $v.by;
      _comment = $v.comment;
      _addedDate = $v.addedDate;
      _postId = $v.postId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostCommentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostCommentsRecord;
  }

  @override
  void update(void Function(PostCommentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostCommentsRecord build() => _build();

  _$PostCommentsRecord _build() {
    final _$result = _$v ??
        new _$PostCommentsRecord._(
            by: by,
            comment: comment,
            addedDate: addedDate,
            postId: postId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
