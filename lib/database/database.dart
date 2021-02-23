import 'package:moor/moor.dart';
import 'package:undo/undo.dart';

import 'db_utils.dart';

export 'shared.dart';

part 'database.g.dart';

@DataClassName('Parameter')
class Parameters extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get origin => text().nullable()();
  TextColumn get preference => text().nullable()();
  IntColumn get adult => integer().nullable()();
  IntColumn get child => integer().nullable()();
  IntColumn get budget => integer().nullable()();
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
          await into(parameters)
              .insert(const ParametersCompanion(origin: Value('INIT')));
        }
      },
    );
  }

  Stream<List<Parameter>> get watchAllParameters => select(parameters).watch();

  Future<dynamic> insertParameter(ParametersCompanion _parameter) async {
    await into(parameters).insert(_parameter);
  }

  Future<dynamic> createParameter(ParametersCompanion _parameter) async {
    final _parameters = await (select(parameters)
          ..orderBy(
            [
              (u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc),
            ],
          ))
        .get();
    _parameter = _parameter.copyWith(id: Value(_parameters.first.id + 1));
    return insertRow(cs, parameters, _parameter);
  }
}
