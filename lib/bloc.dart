import 'package:bloc/bloc.dart';
import 'package:moor/moor.dart' as moor;
import 'package:undo/undo.dart';

import 'database/database.dart';

class HowMuchAppBloc extends Cubit<ChangeStack> {
  HowMuchAppBloc(this.db) : super(db.cs) {
    init();
  }

  final Database db;

  Stream<List<Parameter>> get getParameters => db.watchAllParameters;

  Future<void> insertParameter(
    String origin,
    String preference,
    int adult,
    int child,
    int budget,
    DateTime beginDate,
    DateTime endDate,
    DateTime creationDate,
  ) async {
    await db.insertParameter(
      ParametersCompanion(
        origin: moor.Value(origin),
        preference: moor.Value(preference),
        adult: moor.Value(adult),
        child: moor.Value(child),
        budget: moor.Value(budget),
        beginDate: moor.Value(beginDate),
        endDate: moor.Value(endDate),
        creationDate: moor.Value(creationDate),
      ),
    );
    emit(db.cs);
  }

  Future<void> deleteParameter(Parameter _parameter) async {
    await db.deleteParameter(_parameter);
    emit(db.cs);
  }

  Future<void> updateParameter(Parameter _parameter) async {
    await db.updateParameter(_parameter);
    emit(db.cs);
  }

  void init() {
    emit(db.cs);
  }
}
