// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FamilyRecord> _$familyRecordSerializer =
    new _$FamilyRecordSerializer();

class _$FamilyRecordSerializer implements StructuredSerializer<FamilyRecord> {
  @override
  final Iterable<Type> types = const [FamilyRecord, _$FamilyRecord];
  @override
  final String wireName = 'FamilyRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FamilyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.childFirstName;
    if (value != null) {
      result
        ..add('childFirstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.childLastName;
    if (value != null) {
      result
        ..add('childLastName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.childIconImage;
    if (value != null) {
      result
        ..add('childIconImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.childTopImage;
    if (value != null) {
      result
        ..add('childTopImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parentAccount;
    if (value != null) {
      result
        ..add('parentAccount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.yearBorn;
    if (value != null) {
      result
        ..add('yearBorn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.poids;
    if (value != null) {
      result
        ..add('poids')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  FamilyRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FamilyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'childFirstName':
          result.childFirstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'childLastName':
          result.childLastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'childIconImage':
          result.childIconImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'childTopImage':
          result.childTopImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'parentAccount':
          result.parentAccount = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'yearBorn':
          result.yearBorn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'poids':
          result.poids = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$FamilyRecord extends FamilyRecord {
  @override
  final String? childFirstName;
  @override
  final String? childLastName;
  @override
  final String? childIconImage;
  @override
  final String? childTopImage;
  @override
  final DocumentReference<Object?>? parentAccount;
  @override
  final DateTime? yearBorn;
  @override
  final String? gender;
  @override
  final double? poids;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FamilyRecord([void Function(FamilyRecordBuilder)? updates]) =>
      (new FamilyRecordBuilder()..update(updates))._build();

  _$FamilyRecord._(
      {this.childFirstName,
      this.childLastName,
      this.childIconImage,
      this.childTopImage,
      this.parentAccount,
      this.yearBorn,
      this.gender,
      this.poids,
      this.ffRef})
      : super._();

  @override
  FamilyRecord rebuild(void Function(FamilyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FamilyRecordBuilder toBuilder() => new FamilyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FamilyRecord &&
        childFirstName == other.childFirstName &&
        childLastName == other.childLastName &&
        childIconImage == other.childIconImage &&
        childTopImage == other.childTopImage &&
        parentAccount == other.parentAccount &&
        yearBorn == other.yearBorn &&
        gender == other.gender &&
        poids == other.poids &&
        ffRef == other.ffRef;
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
                                $jc($jc(0, childFirstName.hashCode),
                                    childLastName.hashCode),
                                childIconImage.hashCode),
                            childTopImage.hashCode),
                        parentAccount.hashCode),
                    yearBorn.hashCode),
                gender.hashCode),
            poids.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FamilyRecord')
          ..add('childFirstName', childFirstName)
          ..add('childLastName', childLastName)
          ..add('childIconImage', childIconImage)
          ..add('childTopImage', childTopImage)
          ..add('parentAccount', parentAccount)
          ..add('yearBorn', yearBorn)
          ..add('gender', gender)
          ..add('poids', poids)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FamilyRecordBuilder
    implements Builder<FamilyRecord, FamilyRecordBuilder> {
  _$FamilyRecord? _$v;

  String? _childFirstName;
  String? get childFirstName => _$this._childFirstName;
  set childFirstName(String? childFirstName) =>
      _$this._childFirstName = childFirstName;

  String? _childLastName;
  String? get childLastName => _$this._childLastName;
  set childLastName(String? childLastName) =>
      _$this._childLastName = childLastName;

  String? _childIconImage;
  String? get childIconImage => _$this._childIconImage;
  set childIconImage(String? childIconImage) =>
      _$this._childIconImage = childIconImage;

  String? _childTopImage;
  String? get childTopImage => _$this._childTopImage;
  set childTopImage(String? childTopImage) =>
      _$this._childTopImage = childTopImage;

  DocumentReference<Object?>? _parentAccount;
  DocumentReference<Object?>? get parentAccount => _$this._parentAccount;
  set parentAccount(DocumentReference<Object?>? parentAccount) =>
      _$this._parentAccount = parentAccount;

  DateTime? _yearBorn;
  DateTime? get yearBorn => _$this._yearBorn;
  set yearBorn(DateTime? yearBorn) => _$this._yearBorn = yearBorn;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  double? _poids;
  double? get poids => _$this._poids;
  set poids(double? poids) => _$this._poids = poids;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FamilyRecordBuilder() {
    FamilyRecord._initializeBuilder(this);
  }

  FamilyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _childFirstName = $v.childFirstName;
      _childLastName = $v.childLastName;
      _childIconImage = $v.childIconImage;
      _childTopImage = $v.childTopImage;
      _parentAccount = $v.parentAccount;
      _yearBorn = $v.yearBorn;
      _gender = $v.gender;
      _poids = $v.poids;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FamilyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FamilyRecord;
  }

  @override
  void update(void Function(FamilyRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FamilyRecord build() => _build();

  _$FamilyRecord _build() {
    final _$result = _$v ??
        new _$FamilyRecord._(
            childFirstName: childFirstName,
            childLastName: childLastName,
            childIconImage: childIconImage,
            childTopImage: childTopImage,
            parentAccount: parentAccount,
            yearBorn: yearBorn,
            gender: gender,
            poids: poids,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
