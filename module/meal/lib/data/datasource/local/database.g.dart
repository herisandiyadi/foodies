// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MealTable extends Meal with TableInfo<$MealTable, MealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String> idMeal = GeneratedColumn<String>(
      'id_meal', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idMeal, title, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal';
  @override
  VerificationContext validateIntegrity(Insertable<MealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealData(
      idMeal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_meal'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
    );
  }

  @override
  $MealTable createAlias(String alias) {
    return $MealTable(attachedDatabase, alias);
  }
}

class MealData extends DataClass implements Insertable<MealData> {
  final String idMeal;
  final String title;
  final String imageUrl;
  const MealData(
      {required this.idMeal, required this.title, required this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    map['title'] = Variable<String>(title);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  MealCompanion toCompanion(bool nullToAbsent) {
    return MealCompanion(
      idMeal: Value(idMeal),
      title: Value(title),
      imageUrl: Value(imageUrl),
    );
  }

  factory MealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealData(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      title: serializer.fromJson<String>(json['title']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'title': serializer.toJson<String>(title),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  MealData copyWith({String? idMeal, String? title, String? imageUrl}) =>
      MealData(
        idMeal: idMeal ?? this.idMeal,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
      );
  @override
  String toString() {
    return (StringBuffer('MealData(')
          ..write('idMeal: $idMeal, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMeal, title, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealData &&
          other.idMeal == this.idMeal &&
          other.title == this.title &&
          other.imageUrl == this.imageUrl);
}

class MealCompanion extends UpdateCompanion<MealData> {
  final Value<String> idMeal;
  final Value<String> title;
  final Value<String> imageUrl;
  final Value<int> rowid;
  const MealCompanion({
    this.idMeal = const Value.absent(),
    this.title = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealCompanion.insert({
    required String idMeal,
    required String title,
    required String imageUrl,
    this.rowid = const Value.absent(),
  })  : idMeal = Value(idMeal),
        title = Value(title),
        imageUrl = Value(imageUrl);
  static Insertable<MealData> custom({
    Expression<String>? idMeal,
    Expression<String>? title,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (title != null) 'title': title,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealCompanion copyWith(
      {Value<String>? idMeal,
      Value<String>? title,
      Value<String>? imageUrl,
      Value<int>? rowid}) {
    return MealCompanion(
      idMeal: idMeal ?? this.idMeal,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('title: $title, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $MealTable meal = $MealTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [meal];
}
