import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  int _counter = 0;
  String _status = 'Waiting for input...';

  void _handleInput() {
    final input = _controller.text.trim();

    if (input == 'Avada Kedavra') {
      setState(() {
        _counter = 0;
        _status = ' Counter reset by magic!';
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Counter reset to 0!')));

      _controller.clear();
      return;
    }

    final number = int.tryParse(input);

    if (number != null) {
      setState(() {
        _counter += number;
        _status = number >= 0 ? 'Added $number' : 'Subtracted ${number.abs()}';
      });
    } else {
      setState(() {
        _status = 'Invalid input';
      });
    }

    _controller.clear();
  }

  Color _backgroundColor() {
    if (_counter < 0) {
      return Colors.red.shade100;
    } else if (_counter > 0) {
      return Colors.green.shade100;
    } else {
      return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor(),
      appBar: AppBar(
        title: const Text('Lab 1 — Interactive Counter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter a number to modify the counter.\n'
              'Type "Avada Kedavra" to reset it.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            /// Анімація числа
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                '$_counter',
                key: ValueKey(_counter),
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Статус
            Text(_status, style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 30),

            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter number or magic spell',
              ),
              onSubmitted: (_) => _handleInput(),
            ),

            const SizedBox(height: 16),

            ElevatedButton(onPressed: _handleInput, child: const Text('Apply')),

            const SizedBox(height: 12),

            OutlinedButton(
              onPressed: () {
                setState(() {
                  _counter = 0;
                  _status = 'Reset manually';
                });
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
