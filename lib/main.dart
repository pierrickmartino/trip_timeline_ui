import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';
import 'database/database.dart';
import 'stepper_inside_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider.value(value: PeriodFilter()),
        RepositoryProvider<Database>(
            create: (context) => constructDb(logStatements: true)),
        BlocProvider<HowMuchAppBloc>(
          create: (context) {
            final db = RepositoryProvider.of<Database>(context);
            return HowMuchAppBloc(db);
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
  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

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
                height: MediaQuery.of(context).size.height * 0.95,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Project ${snapshot.data[index].id}'),
                      subtitle: Wrap(
                        spacing: 5,
                        direction: Axis.vertical,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Origin : ' + snapshot.data[index].origin),
                          Text('Preferences : '),
                          Text('Adult : '),
                          Text('Child : '),
                          Text('Budget : '),
                          Text('Begin date : '),
                          Text('End date : '),
                          Text('Creation date : ')
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(icon: Icon(Icons.edit), onPressed: null),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              bloc.deleteParameter(snapshot.data[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text('Parameter successfully deleted'),
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
      )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'container',
          //       style: Theme.of(context).textTheme.headline4,
          //     ),
          //   ],
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBarModalBottomSheet(
          expand: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => const StepperInsideModal(),
        ),
        tooltip: 'Open Modal',
        child: const Icon(Icons.add),
      ),
    );
  }
}
