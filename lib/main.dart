import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;
  int counter = 0;
  List<int> numbers = [];

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    setState(() {
      counter = counter + 1;
      numbers.add(numbers.length);
    });
    print(numbers);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.red),
      )),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello flutter!"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            showTitle ? const MyLargeTitle() : const Text("nothing"),
            IconButton(
              onPressed: toggleTitle,
              icon: const Icon(Icons.remove_red_eye),
            ),
            const Text(
              "click count",
              style: TextStyle(fontSize: 30),
            ),
            for (var n in numbers) Text('$n'),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 30),
            ),
            IconButton(
              iconSize: 40,
              onPressed: onClicked,
              icon: const Icon(Icons.add_box_rounded),
            )
          ]),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState!");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("build!");
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
