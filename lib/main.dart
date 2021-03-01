import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';
import 'database/database.dart';
import 'stepper_inside_modal.dart';

void main() {
  runApp(const MyApp());
}

final _dateFormat = DateFormat.yMMMd();

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider.value(value: PeriodFilter()),
        RepositoryProvider<Database>(
            create: (context) => constructDb(logStatements: true)),
        BlocProvider<ApplicationBloc>(
          create: (context) {
            final db = RepositoryProvider.of<Database>(context);
            return ApplicationBloc(db);
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApplicationBloc get bloc => BlocProvider.of<ApplicationBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<List<Parameter>>(
          stream: bloc.getParameters,
          builder: (context, snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    itemBuilder: (context, index) {
                      String id,
                          originCity,
                          originCountry,
                          preference,
                          adult,
                          child,
                          baby,
                          budgetMin,
                          budgetMax,
                          beginDate,
                          endDate,
                          creationDate;

                      id = snapshot.data[index].id.toString();
                      originCity = snapshot.data[index].originCity;
                      originCountry = snapshot.data[index].originCountry;
                      preference = snapshot.data[index].preference != null
                          ? snapshot.data[index].preference
                              .replaceAll('[', '')
                              .replaceAll(']', '')
                          : '-';
                      adult = snapshot.data[index].adult.toString();
                      child = snapshot.data[index].child.toString();
                      baby = snapshot.data[index].baby.toString();
                      budgetMin = snapshot.data[index].budgetMin.toString();
                      budgetMax = snapshot.data[index].budgetMax.toString();
                      beginDate = snapshot.data[index].beginDate != null
                          ? _dateFormat.format(snapshot.data[index].beginDate)
                          : '-';
                      endDate = snapshot.data[index].endDate != null
                          ? _dateFormat.format(snapshot.data[index].endDate)
                          : '-';
                      creationDate = snapshot.data[index].creationDate != null
                          ? _dateFormat
                              .format(snapshot.data[index].creationDate)
                          : '-';

                      return ListTile(
                        title: Text('Project $id'),
                        subtitle: Wrap(
                          spacing: 5,
                          direction: Axis.vertical,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Origin : $originCity ($originCountry)'),
                            Text('Preferences : $preference'),
                            Text(
                                'Participant : $adult Adult(s) - $child Child(ren) - $baby Baby(s)'),
                            Text('Budget between $budgetMin and $budgetMax'),
                            Text('Period from $beginDate to $endDate'),
                            Text('Created the $creationDate'),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        trailing: Wrap(
                          children: [
                            // const IconButton(
                            //     icon: Icon(Icons.edit), onPressed: null),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                bloc.deleteParameter(snapshot.data[index]);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content:
                                        Text('Project successfully deleted'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = <Widget>[
                const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBarModalBottomSheet(
          expand: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => const StepperInsideModal(),
        ),
        tooltip: 'New Project',
        child: const Icon(Icons.add),
      ),
    );
  }
}
