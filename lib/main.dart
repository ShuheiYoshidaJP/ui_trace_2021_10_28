import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:ui_trace_2021_10_28/wide_width_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _items = [
    const MainView(),
    const MainView(),
    const MainView(),
    const MainView(),
    const MainView(),
  ];

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return Scaffold(
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: const [
                  Text('Cash Cord', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  Spacer(),
                  Icon(Icons.person)
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                  itemCount: _items.length,
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return _items[index];
                  },
                  onPageChanged: (int index) {
                    _currentPageNotifier.value = index;
                  }),
            ),
            const SizedBox(height: 24,),
            _buildCircleIndicator(),
            const SizedBox(height: 24,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: WideWidthButton(
                textColor: Colors.white,
                backgroundColor: Colors.green,
                tapped: (){},
                text: 'Get Free Cash Card',
              ),
            ),
            const SizedBox(height: 48,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }

  _buildCircleIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CirclePageIndicator(
        itemCount: _items.length,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FlutterLogo(
            size: 240,
          ),
          SizedBox(height: 12,),
          Text('Bank with it', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          SizedBox(height: 12,),
          Text('Access banking features like direct deposit, ATM withdraws, and more', style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }

}