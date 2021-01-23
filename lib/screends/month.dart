import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(month());
}

class month extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter DateThai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('th', 'TH'), // Thai
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DateThai"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text("DatePicker"),
                  onPressed: () {
                    showRoundedDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime
                          .now()
                          .year - 5),
                      lastDate: DateTime(DateTime
                          .now()
                          .year + 5),
                      borderRadius: 16,
                      locale: Locale("th", "TH"),
                      era: EraMode.BUDDHIST_YEAR,
                    ).then((date){
                      setState(() {
                        _date = date;
                      });
                    });
                  }
              ),
              Text(_date.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

