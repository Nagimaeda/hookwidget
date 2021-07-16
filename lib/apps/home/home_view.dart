import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

T useChangeNotifierListenable<T extends ChangeNotifier>(T data){
  final state = useState<T>(data);
  return useListenable(state.value);
}

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final homeChangeNotifier = useChangeNotifierListenable(HomeChangeNotifier());
    return Scaffold(
      appBar: AppBar(

        title: Text("Basic App"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${homeChangeNotifier.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buttonPressed(homeChangeNotifier),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<void> _buttonPressed(HomeChangeNotifier homeChangeNotifier) async{
  print("button pressed");
  homeChangeNotifier.reloadState();
}