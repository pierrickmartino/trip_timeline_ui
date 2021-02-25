import 'package:moor/moor.dart';
import 'package:undo/undo.dart';

import 'db_utils.dart';

export 'shared.dart';

part 'database.g.dart';

@DataClassName('Parameter')
class Parameters extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get originCountry => text().nullable()();
  TextColumn get originCity => text().nullable()();
  TextColumn get preference => text().nullable()();
  IntColumn get adult => integer().nullable().withDefault(const Constant(0))();
  IntColumn get child => integer().nullable().withDefault(const Constant(0))();
  IntColumn get baby => integer().nullable().withDefault(const Constant(0))();
  IntColumn get budgetMin => integer().nullable()();
  IntColumn get budgetMax => integer().nullable()();
  DateTimeColumn get beginDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  DateTimeColumn get creationDate => dateTime().nullable()();
}

@UseMoor(
  tables: [Parameters],
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);
  final cs = ChangeStack();
  // : super(FlutterQueryExecutor.inDatabaseFolder(
  //       path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.addColumn(parameters, parameters.creationDate);
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          await into(parameters).insert(ParametersCompanion(
              originCity: const Value('INIT'),
              creationDate: Value(DateTime.now())));
        }
      },
    );
  }

  Stream<List<Parameter>> get watchAllParameters => select(parameters).watch();

  Future<dynamic> insertParameter(ParametersCompanion _parameter) async {
    await into(parameters).insert(_parameter);
  }

  Future<dynamic> updateParameter(Parameter _parameter) async {
    return updateRow(cs, parameters, _parameter);
  }

  Future<dynamic> deleteParameter(Parameter _parameter) async {
    await deleteRow(cs, parameters, _parameter);
  }
}
