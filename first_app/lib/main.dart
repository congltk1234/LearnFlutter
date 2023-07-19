import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;
  var _isSending = false;

  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _loadItem() async {
    final url = Uri.https(
        'shopping-list-flutterapp-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/TimesClick.json');
    final response = await http.get(url);
    final loadedData = json.decode(response.body);
    setState(() {
      _counter = loadedData;
    });
  }

  void _postCounter() async {
    setState(() {
      _isSending = true;
    });
    final url = Uri.https(
        'shopping-list-flutterapp-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/.json');
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'TimesClick': _counter,
        },
      ),
    );

    setState(() {
      _isSending = false;
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        content: Text('Already Post to FireBase'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  _isSending
                      ? null
                      : setState(() {
                          _counter = 0;
                        });
                },
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: _isSending ? null : _postCounter,
                child: _isSending
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Push to DataBase'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
