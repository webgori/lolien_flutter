import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lolien_flutter/dto/custom_game/statistics/Statistics.dart';
import 'package:lolien_flutter/simpleTimeSeriesChart.dart';
import 'package:http/http.dart' as http;

import 'customGameCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoLien',
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
        primarySwatch: Colors.lightBlue,
        primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      home: MyHomePage(title: 'LoLien.kr'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<Statistics> fetchPost() async {
  Uri uri = Uri.parse('https://api.lolien.kr/v1/custom-game/statistics');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Statistics.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Statistics> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(children: <Widget>[
        Text(
          '일별 내전 참여 횟수',
          style: TextStyle(
              color: Color(0xff1976d2),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
          textAlign: TextAlign.center,
        ),
        /*Expanded(
            child: LineChart(
          getCustomGameChartData(),
          swapAnimationDuration: Duration(milliseconds: 150),
          // Optional
          swapAnimationCurve: Curves.linear, // Optional
        )),*/
        ConstrainedBox(
            constraints: BoxConstraints.expand(height: 100.0),
            // adjust the height here
            child: SimpleTimeSeriesChart.withSampleData()),
        //Expanded(child: SimpleLineChart.withSampleData()),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              CustomGameCard(),
              CustomGameCard(),
              CustomGameCard(),
              CustomGameCard(),
              CustomGameCard(),
            ],
          ),
        )
      ]),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 60.0,
              child: DrawerHeader(
                  child: Text(
                    'LoLien.kr',
                    style: TextStyle(fontSize: 25),
                  ),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero),
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.grey[850]),
              title: Text('소개'),
              onTap: () {
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.grey[850]),
              title: Text('당원명부'),
              onTap: () {
                print('Setting is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.games, color: Colors.grey[850]),
              title: Text('내전'),
              onTap: () {
                print('Q&A is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.games, color: Colors.grey[850]),
              title: Text('리그'),
              onTap: () {
                print('Q&A is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.chat, color: Colors.grey[850]),
              title: Text('대화방'),
              onTap: () {
                print('Q&A is clicked');
              },
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        // List<BottomNavigationBar> 아이템 (3)
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "로그인"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
        ],
      ),
    );
  }
}
