import 'package:bloc/bloc.dart';
import 'package:moor/moor.dart' as moor;
import 'package:undo/undo.dart';

import 'database/database.dart';

class ApplicationBloc extends Cubit<ChangeStack> {
  ApplicationBloc(this.db) : super(db.cs) {
    init();
  }

  final Database db;

  Stream<List<Parameter>> get getParameters => db.watchAllParameters;

  Future<void> insertParameter(
    String originCity,
    String originCountry,
    String preference,
    int adult,
    int child,
    int baby,
    int budgetMin,
    int budgetMax,
    DateTime beginDate,
    DateTime endDate,
    DateTime creationDate,
  ) async {
    await db.insertParameter(
      ParametersCompanion(
        originCity: moor.Value(originCity),
        originCountry: moor.Value(originCountry),
        preference: moor.Value(preference),
        adult: moor.Value(adult),
        child: moor.Value(child),
        baby: moor.Value(baby),
        budgetMin: moor.Value(budgetMin),
        budgetMax: moor.Value(budgetMax),
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
