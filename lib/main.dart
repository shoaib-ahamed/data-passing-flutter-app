// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownvalue = 'cr7';
  String dropdownvalue2 = 'kaka';
  TextEditingController inpuText = TextEditingController();

  var items = ['cr7', 'Messi', 'neymar'];

  // debugPrint(dropdownvalue2)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 37, 105),
        title: const Text("Assignment 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondRoute(value: dropdownvalue)),
                  );
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      onChanged: (text) {
                        dropdownvalue2 = text;
                      },
                      controller: inpuText,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter what u like',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SecondRoute(
                              value: dropdownvalue2,
                            ),
                          ),
                        );
                      },
                      child: const Text('Text Input'),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  SecondRoute({Key? key, required this.value}) : super(key: key);
  String value;

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 14, 86),
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text(widget.value),
      ),
    );
  }
}
