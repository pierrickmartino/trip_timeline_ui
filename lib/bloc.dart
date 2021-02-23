import 'package:bloc/bloc.dart';
import 'package:undo/undo.dart';

import 'database/database.dart';

class HowMuchAppBloc extends Cubit<ChangeStack> {
  HowMuchAppBloc(this.db) : super(db.cs) {
    init();
  }

  final Database db;

  Stream<List<Parameter>> get getCategories => db.watchAllParameters;

  void init() {
    emit(db.cs);
  }
}
