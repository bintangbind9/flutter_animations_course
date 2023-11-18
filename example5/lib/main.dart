import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example 5',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const defaultWidth = 100.0;

class _HomePageState extends State<HomePage> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  final _curve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 370,
                ),
                curve: _curve,
                width: _width,
                child: Image.asset(
                  'assets/images/wallpaper.jpg',
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomedIn = !_isZoomedIn;
                _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                _width = _isZoomedIn
                    ? MediaQuery.of(context).size.width
                    : defaultWidth;
              });
            },
            child: Text(_buttonTitle),
          ),
        ],
      ),
    );
  }
}
