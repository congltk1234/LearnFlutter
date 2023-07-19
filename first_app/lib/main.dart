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
  var _isLoading = true;
  String? _error;

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
    try {
      final response = await http.get(url);
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
      }

      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch Data. Please try again later.';
        });
      }
      final loadedData = json.decode(response.body);
      setState(() {
        _counter = loadedData;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Something went wrong. Please try again later.';
      });
    }
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
    Widget? mainContent;

    if (_isLoading) {
      mainContent = const Center(child: CircularProgressIndicator());
    } else {
      mainContent = Center(
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
      );
    }
    if (_error != null) {
      mainContent = Center(
        child: Text(_error!),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: mainContent,
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
