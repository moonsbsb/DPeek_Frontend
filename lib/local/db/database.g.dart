// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SubscriptionTable extends Subscription
    with TableInfo<$SubscriptionTable, SubscriptionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _feeMeta = const VerificationMeta('fee');
  @override
  late final GeneratedColumn<int> fee = GeneratedColumn<int>(
    'fee',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updateDateMeta = const VerificationMeta(
    'updateDate',
  );
  @override
  late final GeneratedColumn<DateTime> updateDate = GeneratedColumn<DateTime>(
    'update_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodOfUseMeta = const VerificationMeta(
    'periodOfUse',
  );
  @override
  late final GeneratedColumn<int> periodOfUse = GeneratedColumn<int>(
    'period_of_use',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<int> totalAmount = GeneratedColumn<int>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isUsingMeta = const VerificationMeta(
    'isUsing',
  );
  @override
  late final GeneratedColumn<bool> isUsing = GeneratedColumn<bool>(
    'is_using',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_using" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fee,
    updateDate,
    periodOfUse,
    totalAmount,
    isUsing,
    category,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscription';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubscriptionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fee')) {
      context.handle(
        _feeMeta,
        fee.isAcceptableOrUnknown(data['fee']!, _feeMeta),
      );
    } else if (isInserting) {
      context.missing(_feeMeta);
    }
    if (data.containsKey('update_date')) {
      context.handle(
        _updateDateMeta,
        updateDate.isAcceptableOrUnknown(data['update_date']!, _updateDateMeta),
      );
    } else if (isInserting) {
      context.missing(_updateDateMeta);
    }
    if (data.containsKey('period_of_use')) {
      context.handle(
        _periodOfUseMeta,
        periodOfUse.isAcceptableOrUnknown(
          data['period_of_use']!,
          _periodOfUseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_periodOfUseMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('is_using')) {
      context.handle(
        _isUsingMeta,
        isUsing.isAcceptableOrUnknown(data['is_using']!, _isUsingMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubscriptionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubscriptionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fee: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fee'],
      )!,
      updateDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}update_date'],
      )!,
      periodOfUse: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}period_of_use'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_amount'],
      )!,
      isUsing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_using'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
    );
  }

  @override
  $SubscriptionTable createAlias(String alias) {
    return $SubscriptionTable(attachedDatabase, alias);
  }
}

class SubscriptionData extends DataClass
    implements Insertable<SubscriptionData> {
  final int id;
  final int fee;
  final DateTime updateDate;
  final int periodOfUse;
  final int totalAmount;
  final bool isUsing;
  final String category;
  const SubscriptionData({
    required this.id,
    required this.fee,
    required this.updateDate,
    required this.periodOfUse,
    required this.totalAmount,
    required this.isUsing,
    required this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fee'] = Variable<int>(fee);
    map['update_date'] = Variable<DateTime>(updateDate);
    map['period_of_use'] = Variable<int>(periodOfUse);
    map['total_amount'] = Variable<int>(totalAmount);
    map['is_using'] = Variable<bool>(isUsing);
    map['category'] = Variable<String>(category);
    return map;
  }

  SubscriptionCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionCompanion(
      id: Value(id),
      fee: Value(fee),
      updateDate: Value(updateDate),
      periodOfUse: Value(periodOfUse),
      totalAmount: Value(totalAmount),
      isUsing: Value(isUsing),
      category: Value(category),
    );
  }

  factory SubscriptionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubscriptionData(
      id: serializer.fromJson<int>(json['id']),
      fee: serializer.fromJson<int>(json['fee']),
      updateDate: serializer.fromJson<DateTime>(json['updateDate']),
      periodOfUse: serializer.fromJson<int>(json['periodOfUse']),
      totalAmount: serializer.fromJson<int>(json['totalAmount']),
      isUsing: serializer.fromJson<bool>(json['isUsing']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fee': serializer.toJson<int>(fee),
      'updateDate': serializer.toJson<DateTime>(updateDate),
      'periodOfUse': serializer.toJson<int>(periodOfUse),
      'totalAmount': serializer.toJson<int>(totalAmount),
      'isUsing': serializer.toJson<bool>(isUsing),
      'category': serializer.toJson<String>(category),
    };
  }

  SubscriptionData copyWith({
    int? id,
    int? fee,
    DateTime? updateDate,
    int? periodOfUse,
    int? totalAmount,
    bool? isUsing,
    String? category,
  }) => SubscriptionData(
    id: id ?? this.id,
    fee: fee ?? this.fee,
    updateDate: updateDate ?? this.updateDate,
    periodOfUse: periodOfUse ?? this.periodOfUse,
    totalAmount: totalAmount ?? this.totalAmount,
    isUsing: isUsing ?? this.isUsing,
    category: category ?? this.category,
  );
  SubscriptionData copyWithCompanion(SubscriptionCompanion data) {
    return SubscriptionData(
      id: data.id.present ? data.id.value : this.id,
      fee: data.fee.present ? data.fee.value : this.fee,
      updateDate: data.updateDate.present
          ? data.updateDate.value
          : this.updateDate,
      periodOfUse: data.periodOfUse.present
          ? data.periodOfUse.value
          : this.periodOfUse,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      isUsing: data.isUsing.present ? data.isUsing.value : this.isUsing,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionData(')
          ..write('id: $id, ')
          ..write('fee: $fee, ')
          ..write('updateDate: $updateDate, ')
          ..write('periodOfUse: $periodOfUse, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('isUsing: $isUsing, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fee,
    updateDate,
    periodOfUse,
    totalAmount,
    isUsing,
    category,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubscriptionData &&
          other.id == this.id &&
          other.fee == this.fee &&
          other.updateDate == this.updateDate &&
          other.periodOfUse == this.periodOfUse &&
          other.totalAmount == this.totalAmount &&
          other.isUsing == this.isUsing &&
          other.category == this.category);
}

class SubscriptionCompanion extends UpdateCompanion<SubscriptionData> {
  final Value<int> id;
  final Value<int> fee;
  final Value<DateTime> updateDate;
  final Value<int> periodOfUse;
  final Value<int> totalAmount;
  final Value<bool> isUsing;
  final Value<String> category;
  const SubscriptionCompanion({
    this.id = const Value.absent(),
    this.fee = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.periodOfUse = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.isUsing = const Value.absent(),
    this.category = const Value.absent(),
  });
  SubscriptionCompanion.insert({
    this.id = const Value.absent(),
    required int fee,
    required DateTime updateDate,
    required int periodOfUse,
    required int totalAmount,
    this.isUsing = const Value.absent(),
    required String category,
  }) : fee = Value(fee),
       updateDate = Value(updateDate),
       periodOfUse = Value(periodOfUse),
       totalAmount = Value(totalAmount),
       category = Value(category);
  static Insertable<SubscriptionData> custom({
    Expression<int>? id,
    Expression<int>? fee,
    Expression<DateTime>? updateDate,
    Expression<int>? periodOfUse,
    Expression<int>? totalAmount,
    Expression<bool>? isUsing,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fee != null) 'fee': fee,
      if (updateDate != null) 'update_date': updateDate,
      if (periodOfUse != null) 'period_of_use': periodOfUse,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (isUsing != null) 'is_using': isUsing,
      if (category != null) 'category': category,
    });
  }

  SubscriptionCompanion copyWith({
    Value<int>? id,
    Value<int>? fee,
    Value<DateTime>? updateDate,
    Value<int>? periodOfUse,
    Value<int>? totalAmount,
    Value<bool>? isUsing,
    Value<String>? category,
  }) {
    return SubscriptionCompanion(
      id: id ?? this.id,
      fee: fee ?? this.fee,
      updateDate: updateDate ?? this.updateDate,
      periodOfUse: periodOfUse ?? this.periodOfUse,
      totalAmount: totalAmount ?? this.totalAmount,
      isUsing: isUsing ?? this.isUsing,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fee.present) {
      map['fee'] = Variable<int>(fee.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<DateTime>(updateDate.value);
    }
    if (periodOfUse.present) {
      map['period_of_use'] = Variable<int>(periodOfUse.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<int>(totalAmount.value);
    }
    if (isUsing.present) {
      map['is_using'] = Variable<bool>(isUsing.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionCompanion(')
          ..write('id: $id, ')
          ..write('fee: $fee, ')
          ..write('updateDate: $updateDate, ')
          ..write('periodOfUse: $periodOfUse, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('isUsing: $isUsing, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $SubscriptionTable subscription = $SubscriptionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [subscription];
}

typedef $$SubscriptionTableCreateCompanionBuilder =
    SubscriptionCompanion Function({
      Value<int> id,
      required int fee,
      required DateTime updateDate,
      required int periodOfUse,
      required int totalAmount,
      Value<bool> isUsing,
      required String category,
    });
typedef $$SubscriptionTableUpdateCompanionBuilder =
    SubscriptionCompanion Function({
      Value<int> id,
      Value<int> fee,
      Value<DateTime> updateDate,
      Value<int> periodOfUse,
      Value<int> totalAmount,
      Value<bool> isUsing,
      Value<String> category,
    });

class $$SubscriptionTableFilterComposer
    extends Composer<_$Database, $SubscriptionTable> {
  $$SubscriptionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get periodOfUse => $composableBuilder(
    column: $table.periodOfUse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUsing => $composableBuilder(
    column: $table.isUsing,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubscriptionTableOrderingComposer
    extends Composer<_$Database, $SubscriptionTable> {
  $$SubscriptionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get periodOfUse => $composableBuilder(
    column: $table.periodOfUse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUsing => $composableBuilder(
    column: $table.isUsing,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubscriptionTableAnnotationComposer
    extends Composer<_$Database, $SubscriptionTable> {
  $$SubscriptionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get periodOfUse => $composableBuilder(
    column: $table.periodOfUse,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isUsing =>
      $composableBuilder(column: $table.isUsing, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$SubscriptionTableTableManager
    extends
        RootTableManager<
          _$Database,
          $SubscriptionTable,
          SubscriptionData,
          $$SubscriptionTableFilterComposer,
          $$SubscriptionTableOrderingComposer,
          $$SubscriptionTableAnnotationComposer,
          $$SubscriptionTableCreateCompanionBuilder,
          $$SubscriptionTableUpdateCompanionBuilder,
          (
            SubscriptionData,
            BaseReferences<_$Database, $SubscriptionTable, SubscriptionData>,
          ),
          SubscriptionData,
          PrefetchHooks Function()
        > {
  $$SubscriptionTableTableManager(_$Database db, $SubscriptionTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> fee = const Value.absent(),
                Value<DateTime> updateDate = const Value.absent(),
                Value<int> periodOfUse = const Value.absent(),
                Value<int> totalAmount = const Value.absent(),
                Value<bool> isUsing = const Value.absent(),
                Value<String> category = const Value.absent(),
              }) => SubscriptionCompanion(
                id: id,
                fee: fee,
                updateDate: updateDate,
                periodOfUse: periodOfUse,
                totalAmount: totalAmount,
                isUsing: isUsing,
                category: category,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int fee,
                required DateTime updateDate,
                required int periodOfUse,
                required int totalAmount,
                Value<bool> isUsing = const Value.absent(),
                required String category,
              }) => SubscriptionCompanion.insert(
                id: id,
                fee: fee,
                updateDate: updateDate,
                periodOfUse: periodOfUse,
                totalAmount: totalAmount,
                isUsing: isUsing,
                category: category,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubscriptionTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $SubscriptionTable,
      SubscriptionData,
      $$SubscriptionTableFilterComposer,
      $$SubscriptionTableOrderingComposer,
      $$SubscriptionTableAnnotationComposer,
      $$SubscriptionTableCreateCompanionBuilder,
      $$SubscriptionTableUpdateCompanionBuilder,
      (
        SubscriptionData,
        BaseReferences<_$Database, $SubscriptionTable, SubscriptionData>,
      ),
      SubscriptionData,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$SubscriptionTableTableManager get subscription =>
      $$SubscriptionTableTableManager(_db, _db.subscription);
}
