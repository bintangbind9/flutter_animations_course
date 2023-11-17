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
      title: 'Example 4',
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

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const people = [
  Person(name: 'Bintang', age: 26, emoji: '🙎‍♂️'),
  Person(name: 'Maman', age: 24, emoji: '👨‍💼'),
  Person(name: 'Kharen', age: 12, emoji: '🤵‍♀️'),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(person: person),
                ),
              );
            },
            leading: Hero(
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                      color: Colors.transparent,
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).chain(
                            CurveTween(curve: Curves.fastOutSlowIn),
                          ),
                        ),
                        child: toHeroContext.widget,
                      ),
                    );
                  case HeroFlightDirection.pop:
                    return Material(
                      color: Colors.transparent,
                      child: fromHeroContext.widget,
                    );
                }
              },
              tag: person.name,
              child: Text(
                person.emoji,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            title: Text(person.name),
            subtitle: Text('${person.age} years old'),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Person person;

  const DetailsPage({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: person.name,
          child: Text(
            person.emoji,
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              person.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              '${person.age} years old',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
