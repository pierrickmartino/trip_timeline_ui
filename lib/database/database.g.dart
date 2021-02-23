// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Parameter extends DataClass implements Insertable<Parameter> {
  final int id;
  final String origin;
  final String preference;
  final int adult;
  final int child;
  final int budget;
  final DateTime beginDate;
  final DateTime endDate;
  final DateTime creationDate;
  Parameter(
      {@required this.id,
      this.origin,
      this.preference,
      this.adult,
      this.child,
      this.budget,
      this.beginDate,
      this.endDate,
      this.creationDate});
  factory Parameter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Parameter(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      origin:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}origin']),
      preference: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}preference']),
      adult: intType.mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      child: intType.mapFromDatabaseResponse(data['${effectivePrefix}child']),
      budget: intType.mapFromDatabaseResponse(data['${effectivePrefix}budget']),
      beginDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}begin_date']),
      endDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      creationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || preference != null) {
      map['preference'] = Variable<String>(preference);
    }
    if (!nullToAbsent || adult != null) {
      map['adult'] = Variable<int>(adult);
    }
    if (!nullToAbsent || child != null) {
      map['child'] = Variable<int>(child);
    }
    if (!nullToAbsent || budget != null) {
      map['budget'] = Variable<int>(budget);
    }
    if (!nullToAbsent || beginDate != null) {
      map['begin_date'] = Variable<DateTime>(beginDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || creationDate != null) {
      map['creation_date'] = Variable<DateTime>(creationDate);
    }
    return map;
  }

  ParametersCompanion toCompanion(bool nullToAbsent) {
    return ParametersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      preference: preference == null && nullToAbsent
          ? const Value.absent()
          : Value(preference),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      child:
          child == null && nullToAbsent ? const Value.absent() : Value(child),
      budget:
          budget == null && nullToAbsent ? const Value.absent() : Value(budget),
      beginDate: beginDate == null && nullToAbsent
          ? const Value.absent()
          : Value(beginDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      creationDate: creationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDate),
    );
  }

  factory Parameter.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Parameter(
      id: serializer.fromJson<int>(json['id']),
      origin: serializer.fromJson<String>(json['origin']),
      preference: serializer.fromJson<String>(json['preference']),
      adult: serializer.fromJson<int>(json['adult']),
      child: serializer.fromJson<int>(json['child']),
      budget: serializer.fromJson<int>(json['budget']),
      beginDate: serializer.fromJson<DateTime>(json['beginDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'origin': serializer.toJson<String>(origin),
      'preference': serializer.toJson<String>(preference),
      'adult': serializer.toJson<int>(adult),
      'child': serializer.toJson<int>(child),
      'budget': serializer.toJson<int>(budget),
      'beginDate': serializer.toJson<DateTime>(beginDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  Parameter copyWith(
          {int id,
          String origin,
          String preference,
          int adult,
          int child,
          int budget,
          DateTime beginDate,
          DateTime endDate,
          DateTime creationDate}) =>
      Parameter(
        id: id ?? this.id,
        origin: origin ?? this.origin,
        preference: preference ?? this.preference,
        adult: adult ?? this.adult,
        child: child ?? this.child,
        budget: budget ?? this.budget,
        beginDate: beginDate ?? this.beginDate,
        endDate: endDate ?? this.endDate,
        creationDate: creationDate ?? this.creationDate,
      );
  @override
  String toString() {
    return (StringBuffer('Parameter(')
          ..write('id: $id, ')
          ..write('origin: $origin, ')
          ..write('preference: $preference, ')
          ..write('adult: $adult, ')
          ..write('child: $child, ')
          ..write('budget: $budget, ')
          ..write('beginDate: $beginDate, ')
          ..write('endDate: $endDate, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          origin.hashCode,
          $mrjc(
              preference.hashCode,
              $mrjc(
                  adult.hashCode,
                  $mrjc(
                      child.hashCode,
                      $mrjc(
                          budget.hashCode,
                          $mrjc(
                              beginDate.hashCode,
                              $mrjc(endDate.hashCode,
                                  creationDate.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Parameter &&
          other.id == this.id &&
          other.origin == this.origin &&
          other.preference == this.preference &&
          other.adult == this.adult &&
          other.child == this.child &&
          other.budget == this.budget &&
          other.beginDate == this.beginDate &&
          other.endDate == this.endDate &&
          other.creationDate == this.creationDate);
}

class ParametersCompanion extends UpdateCompanion<Parameter> {
  final Value<int> id;
  final Value<String> origin;
  final Value<String> preference;
  final Value<int> adult;
  final Value<int> child;
  final Value<int> budget;
  final Value<DateTime> beginDate;
  final Value<DateTime> endDate;
  final Value<DateTime> creationDate;
  const ParametersCompanion({
    this.id = const Value.absent(),
    this.origin = const Value.absent(),
    this.preference = const Value.absent(),
    this.adult = const Value.absent(),
    this.child = const Value.absent(),
    this.budget = const Value.absent(),
    this.beginDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  ParametersCompanion.insert({
    this.id = const Value.absent(),
    this.origin = const Value.absent(),
    this.preference = const Value.absent(),
    this.adult = const Value.absent(),
    this.child = const Value.absent(),
    this.budget = const Value.absent(),
    this.beginDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  static Insertable<Parameter> custom({
    Expression<int> id,
    Expression<String> origin,
    Expression<String> preference,
    Expression<int> adult,
    Expression<int> child,
    Expression<int> budget,
    Expression<DateTime> beginDate,
    Expression<DateTime> endDate,
    Expression<DateTime> creationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (origin != null) 'origin': origin,
      if (preference != null) 'preference': preference,
      if (adult != null) 'adult': adult,
      if (child != null) 'child': child,
      if (budget != null) 'budget': budget,
      if (beginDate != null) 'begin_date': beginDate,
      if (endDate != null) 'end_date': endDate,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  ParametersCompanion copyWith(
      {Value<int> id,
      Value<String> origin,
      Value<String> preference,
      Value<int> adult,
      Value<int> child,
      Value<int> budget,
      Value<DateTime> beginDate,
      Value<DateTime> endDate,
      Value<DateTime> creationDate}) {
    return ParametersCompanion(
      id: id ?? this.id,
      origin: origin ?? this.origin,
      preference: preference ?? this.preference,
      adult: adult ?? this.adult,
      child: child ?? this.child,
      budget: budget ?? this.budget,
      beginDate: beginDate ?? this.beginDate,
      endDate: endDate ?? this.endDate,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (preference.present) {
      map['preference'] = Variable<String>(preference.value);
    }
    if (adult.present) {
      map['adult'] = Variable<int>(adult.value);
    }
    if (child.present) {
      map['child'] = Variable<int>(child.value);
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    if (beginDate.present) {
      map['begin_date'] = Variable<DateTime>(beginDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParametersCompanion(')
          ..write('id: $id, ')
          ..write('origin: $origin, ')
          ..write('preference: $preference, ')
          ..write('adult: $adult, ')
          ..write('child: $child, ')
          ..write('budget: $budget, ')
          ..write('beginDate: $beginDate, ')
          ..write('endDate: $endDate, ')
          ..write('creationDate: $creationDate')
          ..write(')'))
        .toString();
  }
}

class $ParametersTable extends Parameters
    with TableInfo<$ParametersTable, Parameter> {
  final GeneratedDatabase _db;
  final String _alias;
  $ParametersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _originMeta = const VerificationMeta('origin');
  GeneratedTextColumn _origin;
  @override
  GeneratedTextColumn get origin => _origin ??= _constructOrigin();
  GeneratedTextColumn _constructOrigin() {
    return GeneratedTextColumn(
      'origin',
      $tableName,
      true,
    );
  }

  final VerificationMeta _preferenceMeta = const VerificationMeta('preference');
  GeneratedTextColumn _preference;
  @override
  GeneratedTextColumn get preference => _preference ??= _constructPreference();
  GeneratedTextColumn _constructPreference() {
    return GeneratedTextColumn(
      'preference',
      $tableName,
      true,
    );
  }

  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  GeneratedIntColumn _adult;
  @override
  GeneratedIntColumn get adult => _adult ??= _constructAdult();
  GeneratedIntColumn _constructAdult() {
    return GeneratedIntColumn(
      'adult',
      $tableName,
      true,
    );
  }

  final VerificationMeta _childMeta = const VerificationMeta('child');
  GeneratedIntColumn _child;
  @override
  GeneratedIntColumn get child => _child ??= _constructChild();
  GeneratedIntColumn _constructChild() {
    return GeneratedIntColumn(
      'child',
      $tableName,
      true,
    );
  }

  final VerificationMeta _budgetMeta = const VerificationMeta('budget');
  GeneratedIntColumn _budget;
  @override
  GeneratedIntColumn get budget => _budget ??= _constructBudget();
  GeneratedIntColumn _constructBudget() {
    return GeneratedIntColumn(
      'budget',
      $tableName,
      true,
    );
  }

  final VerificationMeta _beginDateMeta = const VerificationMeta('beginDate');
  GeneratedDateTimeColumn _beginDate;
  @override
  GeneratedDateTimeColumn get beginDate => _beginDate ??= _constructBeginDate();
  GeneratedDateTimeColumn _constructBeginDate() {
    return GeneratedDateTimeColumn(
      'begin_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedDateTimeColumn _endDate;
  @override
  GeneratedDateTimeColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedDateTimeColumn _constructEndDate() {
    return GeneratedDateTimeColumn(
      'end_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  GeneratedDateTimeColumn _creationDate;
  @override
  GeneratedDateTimeColumn get creationDate =>
      _creationDate ??= _constructCreationDate();
  GeneratedDateTimeColumn _constructCreationDate() {
    return GeneratedDateTimeColumn(
      'creation_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        origin,
        preference,
        adult,
        child,
        budget,
        beginDate,
        endDate,
        creationDate
      ];
  @override
  $ParametersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'parameters';
  @override
  final String actualTableName = 'parameters';
  @override
  VerificationContext validateIntegrity(Insertable<Parameter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin'], _originMeta));
    }
    if (data.containsKey('preference')) {
      context.handle(
          _preferenceMeta,
          preference.isAcceptableOrUnknown(
              data['preference'], _preferenceMeta));
    }
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult'], _adultMeta));
    }
    if (data.containsKey('child')) {
      context.handle(
          _childMeta, child.isAcceptableOrUnknown(data['child'], _childMeta));
    }
    if (data.containsKey('budget')) {
      context.handle(_budgetMeta,
          budget.isAcceptableOrUnknown(data['budget'], _budgetMeta));
    }
    if (data.containsKey('begin_date')) {
      context.handle(_beginDateMeta,
          beginDate.isAcceptableOrUnknown(data['begin_date'], _beginDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date'], _creationDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Parameter map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Parameter.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ParametersTable createAlias(String alias) {
    return $ParametersTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ParametersTable _parameters;
  $ParametersTable get parameters => _parameters ??= $ParametersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [parameters];
}
