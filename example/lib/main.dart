// ignore_for_file: prefer_const_constructors

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('zh'),
      ],
      theme: ThemeData.light(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? selectedDate; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedDate != null)
              Text(DateFormat(
                'MMM dd, yy',
              ).format(selectedDate!)),
            TextButton(
              onPressed: () async {
                final date = await showDatePickerDialog(
                    context: context,
                    padding: EdgeInsets.all(10),
                    initialDate: DateTime.now(),
                    contentPadding: EdgeInsets.all(35),
                    maxDate: DateTime.now().add(const Duration(days: 365 * 3)),
                    minDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
                    leadingDateTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    currentDateDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 153, 88, 31),
                    ),
                    daysNameTextStyle: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 153, 88, 31),
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                    currentDateTextStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    slidersColor: Color.fromARGB(255, 153, 88, 31),
                    slidersSize: 25,
                    selectedCellTextStyle: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    enabledCellTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    selectedCellDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 153, 88, 31),
                    ));
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
              child: const Text('Show Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
