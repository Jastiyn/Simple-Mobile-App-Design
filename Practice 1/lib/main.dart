import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// --------------- basta yung may plus button lang---------------
// void main () {
//   runApp(const StateManagementActivity());
// }

// class StateManagementActivity extends StatelessWidget {
//   const StateManagementActivity ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home : MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage ({super.key});

//   @override
//   State <MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ephemeral State Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// ------------------------- yung na papalitan theme lang -----------------
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeModel(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeModel = Provider.of<ThemeModel>(context);

//     return MaterialApp(
//       theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
//       home: const MyHome(),
//     );
//   }
// }

// class ThemeModel with ChangeNotifier {
//   bool _isDark = false;

//   bool get isDark => _isDark;

//   void toggleTheme() {
//     _isDark = !_isDark;
//     notifyListeners();
//   }
// }

// class MyHome extends StatelessWidget {
//   const MyHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeModel = Provider.of<ThemeModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('App State Example'),
//         actions: [
//           Switch(
//             value: themeModel.isDark,
//             onChanged: (_) => themeModel.toggleTheme(),
//           ),
//         ],
//       ),
//       body: Center(
//         child: const Text('Toggle the theme using the switch in the app bar.'),
//       ),
//     );
//   }
// }

// ------------------------- combined pero walang design-----------------------
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeModel(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeModel = Provider.of<ThemeModel>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
//       home: const MyHomePage(),
//     );
//   }
// }

// // app state
// class ThemeModel with ChangeNotifier {
//   bool _isDark = false;

//   bool get isDark => _isDark;

//   void toggleTheme() {
//     _isDark = !_isDark;
//     notifyListeners();
//   }
// }

// // ephemeral state
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeModel = Provider.of<ThemeModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ephemeral + App State'),
//         actions: [
//           Switch(
//             value: themeModel.isDark,
//             onChanged: (_) => themeModel.toggleTheme(),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


//---------------------- combined na may design na-------------------------
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.pinkAccent,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.pinkAccent,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purple,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
      themeMode: themeModel.isDark ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}

class ThemeModel with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ephemeral + App State'),
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              Switch(
                value: themeModel.isDark,
                onChanged: (_) => themeModel.toggleTheme(),
              ),
              const Icon(Icons.dark_mode),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}