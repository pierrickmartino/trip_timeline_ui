// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Parameter extends DataClass implements Insertable<Parameter> {
  final int id;
  final String originCountry;
  final String originCity;
  final String preference;
  final int adult;
  final int child;
  final int baby;
  final int budgetMin;
  final int budgetMax;
  final DateTime beginDate;
  final DateTime endDate;
  final DateTime creationDate;
  Parameter(
      {@required this.id,
      this.originCountry,
      this.originCity,
      this.preference,
      this.adult,
      this.child,
      this.baby,
      this.budgetMin,
      this.budgetMax,
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
      originCountry: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}origin_country']),
      originCity: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}origin_city']),
      preference: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}preference']),
      adult: intType.mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      child: intType.mapFromDatabaseResponse(data['${effectivePrefix}child']),
      baby: intType.mapFromDatabaseResponse(data['${effectivePrefix}baby']),
      budgetMin:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}budget_min']),
      budgetMax:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}budget_max']),
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
    if (!nullToAbsent || originCountry != null) {
      map['origin_country'] = Variable<String>(originCountry);
    }
    if (!nullToAbsent || originCity != null) {
      map['origin_city'] = Variable<String>(originCity);
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
    if (!nullToAbsent || baby != null) {
      map['baby'] = Variable<int>(baby);
    }
    if (!nullToAbsent || budgetMin != null) {
      map['budget_min'] = Variable<int>(budgetMin);
    }
    if (!nullToAbsent || budgetMax != null) {
      map['budget_max'] = Variable<int>(budgetMax);
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
      originCountry: originCountry == null && nullToAbsent
          ? const Value.absent()
          : Value(originCountry),
      originCity: originCity == null && nullToAbsent
          ? const Value.absent()
          : Value(originCity),
      preference: preference == null && nullToAbsent
          ? const Value.absent()
          : Value(preference),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      child:
          child == null && nullToAbsent ? const Value.absent() : Value(child),
      baby: baby == null && nullToAbsent ? const Value.absent() : Value(baby),
      budgetMin: budgetMin == null && nullToAbsent
          ? const Value.absent()
          : Value(budgetMin),
      budgetMax: budgetMax == null && nullToAbsent
          ? const Value.absent()
          : Value(budgetMax),
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
      originCountry: serializer.fromJson<String>(json['originCountry']),
      originCity: serializer.fromJson<String>(json['originCity']),
      preference: serializer.fromJson<String>(json['preference']),
      adult: serializer.fromJson<int>(json['adult']),
      child: serializer.fromJson<int>(json['child']),
      baby: serializer.fromJson<int>(json['baby']),
      budgetMin: serializer.fromJson<int>(json['budgetMin']),
      budgetMax: serializer.fromJson<int>(json['budgetMax']),
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
      'originCountry': serializer.toJson<String>(originCountry),
      'originCity': serializer.toJson<String>(originCity),
      'preference': serializer.toJson<String>(preference),
      'adult': serializer.toJson<int>(adult),
      'child': serializer.toJson<int>(child),
      'baby': serializer.toJson<int>(baby),
      'budgetMin': serializer.toJson<int>(budgetMin),
      'budgetMax': serializer.toJson<int>(budgetMax),
      'beginDate': serializer.toJson<DateTime>(beginDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'creationDate': serializer.toJson<DateTime>(creationDate),
    };
  }

  Parameter copyWith(
          {int id,
          String originCountry,
          String originCity,
          String preference,
          int adult,
          int child,
          int baby,
          int budgetMin,
          int budgetMax,
          DateTime beginDate,
          DateTime endDate,
          DateTime creationDate}) =>
      Parameter(
        id: id ?? this.id,
        originCountry: originCountry ?? this.originCountry,
        originCity: originCity ?? this.originCity,
        preference: preference ?? this.preference,
        adult: adult ?? this.adult,
        child: child ?? this.child,
        baby: baby ?? this.baby,
        budgetMin: budgetMin ?? this.budgetMin,
        budgetMax: budgetMax ?? this.budgetMax,
        beginDate: beginDate ?? this.beginDate,
        endDate: endDate ?? this.endDate,
        creationDate: creationDate ?? this.creationDate,
      );
  @override
  String toString() {
    return (StringBuffer('Parameter(')
          ..write('id: $id, ')
          ..write('originCountry: $originCountry, ')
          ..write('originCity: $originCity, ')
          ..write('preference: $preference, ')
          ..write('adult: $adult, ')
          ..write('child: $child, ')
          ..write('baby: $baby, ')
          ..write('budgetMin: $budgetMin, ')
          ..write('budgetMax: $budgetMax, ')
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
          originCountry.hashCode,
          $mrjc(
              originCity.hashCode,
              $mrjc(
                  preference.hashCode,
                  $mrjc(
                      adult.hashCode,
                      $mrjc(
                          child.hashCode,
                          $mrjc(
                              baby.hashCode,
                              $mrjc(
                                  budgetMin.hashCode,
                                  $mrjc(
                                      budgetMax.hashCode,
                                      $mrjc(
                                          beginDate.hashCode,
                                          $mrjc(endDate.hashCode,
                                              creationDate.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Parameter &&
          other.id == this.id &&
          other.originCountry == this.originCountry &&
          other.originCity == this.originCity &&
          other.preference == this.preference &&
          other.adult == this.adult &&
          other.child == this.child &&
          other.baby == this.baby &&
          other.budgetMin == this.budgetMin &&
          other.budgetMax == this.budgetMax &&
          other.beginDate == this.beginDate &&
          other.endDate == this.endDate &&
          other.creationDate == this.creationDate);
}

class ParametersCompanion extends UpdateCompanion<Parameter> {
  final Value<int> id;
  final Value<String> originCountry;
  final Value<String> originCity;
  final Value<String> preference;
  final Value<int> adult;
  final Value<int> child;
  final Value<int> baby;
  final Value<int> budgetMin;
  final Value<int> budgetMax;
  final Value<DateTime> beginDate;
  final Value<DateTime> endDate;
  final Value<DateTime> creationDate;
  const ParametersCompanion({
    this.id = const Value.absent(),
    this.originCountry = const Value.absent(),
    this.originCity = const Value.absent(),
    this.preference = const Value.absent(),
    this.adult = const Value.absent(),
    this.child = const Value.absent(),
    this.baby = const Value.absent(),
    this.budgetMin = const Value.absent(),
    this.budgetMax = const Value.absent(),
    this.beginDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  ParametersCompanion.insert({
    this.id = const Value.absent(),
    this.originCountry = const Value.absent(),
    this.originCity = const Value.absent(),
    this.preference = const Value.absent(),
    this.adult = const Value.absent(),
    this.child = const Value.absent(),
    this.baby = const Value.absent(),
    this.budgetMin = const Value.absent(),
    this.budgetMax = const Value.absent(),
    this.beginDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.creationDate = const Value.absent(),
  });
  static Insertable<Parameter> custom({
    Expression<int> id,
    Expression<String> originCountry,
    Expression<String> originCity,
    Expression<String> preference,
    Expression<int> adult,
    Expression<int> child,
    Expression<int> baby,
    Expression<int> budgetMin,
    Expression<int> budgetMax,
    Expression<DateTime> beginDate,
    Expression<DateTime> endDate,
    Expression<DateTime> creationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (originCountry != null) 'origin_country': originCountry,
      if (originCity != null) 'origin_city': originCity,
      if (preference != null) 'preference': preference,
      if (adult != null) 'adult': adult,
      if (child != null) 'child': child,
      if (baby != null) 'baby': baby,
      if (budgetMin != null) 'budget_min': budgetMin,
      if (budgetMax != null) 'budget_max': budgetMax,
      if (beginDate != null) 'begin_date': beginDate,
      if (endDate != null) 'end_date': endDate,
      if (creationDate != null) 'creation_date': creationDate,
    });
  }

  ParametersCompanion copyWith(
      {Value<int> id,
      Value<String> originCountry,
      Value<String> originCity,
      Value<String> preference,
      Value<int> adult,
      Value<int> child,
      Value<int> baby,
      Value<int> budgetMin,
      Value<int> budgetMax,
      Value<DateTime> beginDate,
      Value<DateTime> endDate,
      Value<DateTime> creationDate}) {
    return ParametersCompanion(
      id: id ?? this.id,
      originCountry: originCountry ?? this.originCountry,
      originCity: originCity ?? this.originCity,
      preference: preference ?? this.preference,
      adult: adult ?? this.adult,
      child: child ?? this.child,
      baby: baby ?? this.baby,
      budgetMin: budgetMin ?? this.budgetMin,
      budgetMax: budgetMax ?? this.budgetMax,
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
    if (originCountry.present) {
      map['origin_country'] = Variable<String>(originCountry.value);
    }
    if (originCity.present) {
      map['origin_city'] = Variable<String>(originCity.value);
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
    if (baby.present) {
      map['baby'] = Variable<int>(baby.value);
    }
    if (budgetMin.present) {
      map['budget_min'] = Variable<int>(budgetMin.value);
    }
    if (budgetMax.present) {
      map['budget_max'] = Variable<int>(budgetMax.value);
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
          ..write('originCountry: $originCountry, ')
          ..write('originCity: $originCity, ')
          ..write('preference: $preference, ')
          ..write('adult: $adult, ')
          ..write('child: $child, ')
          ..write('baby: $baby, ')
          ..write('budgetMin: $budgetMin, ')
          ..write('budgetMax: $budgetMax, ')
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

  final VerificationMeta _originCountryMeta =
      const VerificationMeta('originCountry');
  GeneratedTextColumn _originCountry;
  @override
  GeneratedTextColumn get originCountry =>
      _originCountry ??= _constructOriginCountry();
  GeneratedTextColumn _constructOriginCountry() {
    return GeneratedTextColumn(
      'origin_country',
      $tableName,
      true,
    );
  }

  final VerificationMeta _originCityMeta = const VerificationMeta('originCity');
  GeneratedTextColumn _originCity;
  @override
  GeneratedTextColumn get originCity => _originCity ??= _constructOriginCity();
  GeneratedTextColumn _constructOriginCity() {
    return GeneratedTextColumn(
      'origin_city',
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
    return GeneratedIntColumn('adult', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _childMeta = const VerificationMeta('child');
  GeneratedIntColumn _child;
  @override
  GeneratedIntColumn get child => _child ??= _constructChild();
  GeneratedIntColumn _constructChild() {
    return GeneratedIntColumn('child', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _babyMeta = const VerificationMeta('baby');
  GeneratedIntColumn _baby;
  @override
  GeneratedIntColumn get baby => _baby ??= _constructBaby();
  GeneratedIntColumn _constructBaby() {
    return GeneratedIntColumn('baby', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _budgetMinMeta = const VerificationMeta('budgetMin');
  GeneratedIntColumn _budgetMin;
  @override
  GeneratedIntColumn get budgetMin => _budgetMin ??= _constructBudgetMin();
  GeneratedIntColumn _constructBudgetMin() {
    return GeneratedIntColumn(
      'budget_min',
      $tableName,
      true,
    );
  }

  final VerificationMeta _budgetMaxMeta = const VerificationMeta('budgetMax');
  GeneratedIntColumn _budgetMax;
  @override
  GeneratedIntColumn get budgetMax => _budgetMax ??= _constructBudgetMax();
  GeneratedIntColumn _constructBudgetMax() {
    return GeneratedIntColumn(
      'budget_max',
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
        originCountry,
        originCity,
        preference,
        adult,
        child,
        baby,
        budgetMin,
        budgetMax,
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
    if (data.containsKey('origin_country')) {
      context.handle(
          _originCountryMeta,
          originCountry.isAcceptableOrUnknown(
              data['origin_country'], _originCountryMeta));
    }
    if (data.containsKey('origin_city')) {
      context.handle(
          _originCityMeta,
          originCity.isAcceptableOrUnknown(
              data['origin_city'], _originCityMeta));
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
    if (data.containsKey('baby')) {
      context.handle(
          _babyMeta, baby.isAcceptableOrUnknown(data['baby'], _babyMeta));
    }
    if (data.containsKey('budget_min')) {
      context.handle(_budgetMinMeta,
          budgetMin.isAcceptableOrUnknown(data['budget_min'], _budgetMinMeta));
    }
    if (data.containsKey('budget_max')) {
      context.handle(_budgetMaxMeta,
          budgetMax.isAcceptableOrUnknown(data['budget_max'], _budgetMaxMeta));
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
