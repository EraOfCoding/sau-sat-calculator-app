import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int _sauNum = 3;
  static int _sau1cur = 0;
  static int _sau1max = 1;
  static int _sau2cur = 0;
  static int _sau2max = 1;
  static int _sau3cur = 0;
  static int _sau3max = 1;
  static bool _passedSAT = false;
  static int _satCur = 0;
  static int _satMax = 1;
  static double satResult = _satCur / _satMax;
  static double _sauResult3 =
      (_sau1cur + _sau2cur + _sau3cur) / (_sau1max + _sau2max + _sau3max);
  static double _sauResult2 = (_sau1cur + _sau2cur) / (_sau1max + _sau2max);
  static double _sauResult1 = _sau1cur / _sau1max;

  @override
  Widget build(BuildContext context) {
    void init() {
      _sauResult3 =
          (_sau1cur + _sau2cur + _sau3cur) / (_sau1max + _sau2max + _sau3max);
      _sauResult2 = (_sau1cur + _sau2cur) / (_sau1max + _sau2max);
      _sauResult1 = _sau1cur / _sau1max;
      satResult = _satCur / _satMax;
      if (_sau1cur > _sau1max) _sau1cur = _sau1max;
      if (_sau2cur > _sau2max) _sau2cur = _sau2max;
      if (_sau3cur > _sau3max) _sau3cur = _sau3max;
      if (_satCur > _satMax) _satCur = _satMax;
    }

    _sauResult3 =
        (_sau1cur + _sau2cur + _sau3cur) / (_sau1max + _sau2max + _sau3max);
    _sauResult2 = (_sau1cur + _sau2cur) / (_sau1max + _sau2max);
    _sauResult1 = _sau1cur / _sau1max;
    Widget sausNum = Container(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      decoration: fieldDecoration(),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text('SAUs number', style: Theme.of(context).textTheme.headline2),
          NumberPicker(
              value: _sauNum,
              minValue: 1,
              maxValue: 3,
              step: 1,
              haptics: true,
              textStyle: Theme.of(context).textTheme.headline3,
              onChanged: (value) => {setState(() => _sauNum = value), init()}),
          SizedBox(height: 32),
        ],
      ),
    );

    Widget passedSat = Container(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Passed SAT',
            style: Theme.of(context).textTheme.headline2,
          ),
          Checkbox(
            value: _passedSAT,
            onChanged: (bool value) {
              setState(() {
                _passedSAT = value;
              });
              init();
            },
            activeColor: Colors.blue,
          ),
        ],
      ),
    );

    Widget result = Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
      child: ListTile(
        title: Text(
          _passedSAT
              ? (_sauNum == 1
                      ? (((_sauResult1 + satResult) / 2 * 10000).round() / 100)
                          .toString()
                      : _sauNum == 2
                          ? (((_sauResult2 + satResult) / 2 * 10000).round() /
                                  100)
                              .toString()
                          : (((_sauResult3 + satResult) / 2 * 10000).round() /
                                  100)
                              .toString()) +
                  '% is your result'
              : (_sauNum == 1
                      ? ((_sauResult1 * 10000).round() / 100).toString()
                      : _sauNum == 2
                          ? ((_sauResult2 * 10000).round() / 100).toString()
                          : ((_sauResult3 * 10000).round() / 100).toString()) +
                  '% is your result',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );

    Widget credits = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Made with ❤️ by Yerassyl from 9D",
        style: Theme.of(context).textTheme.headline5,
      ),
    );

    //_________________________ sorry for bad construction :/
    Widget _sauScore1 = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: fieldDecoration(),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'SAU 1',
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                value: _sau1cur,
                minValue: 0,
                maxValue: 99,
                step: 1,
                haptics: true,
                textStyle: Theme.of(context).textTheme.headline3,
                onChanged: (value) =>
                    {setState(() => _sau1cur = value), init()},
              ),
              Text(
                '/',
                style: Theme.of(context).textTheme.headline2,
              ),
              NumberPicker(
                value: _sau1max,
                minValue: 0,
                maxValue: 99,
                step: 1,
                haptics: true,
                textStyle: Theme.of(context).textTheme.headline3,
                onChanged: (value) =>
                    {setState(() => _sau1max = value), init()},
              ),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );

    Widget _sauScore2 = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: fieldDecoration(),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'SAU 2',
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                value: _sau2cur,
                minValue: 0,
                maxValue: 99,
                step: 1,
                haptics: true,
                textStyle: Theme.of(context).textTheme.headline3,
                onChanged: (value) =>
                    {setState(() => _sau2cur = value), init()},
              ),
              Text(
                '/',
                style: Theme.of(context).textTheme.headline2,
              ),
              NumberPicker(
                value: _sau2max,
                minValue: 0,
                maxValue: 99,
                step: 1,
                haptics: true,
                textStyle: Theme.of(context).textTheme.headline3,
                onChanged: (value) =>
                    {setState(() => _sau2max = value), init()},
              ),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );

    Widget _sauScore3 = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: fieldDecoration(),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'SAU 3',
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                value: _sau3cur,
                minValue: 0,
                maxValue: 99,
                step: 1,
                haptics: true,
                textStyle: Theme.of(context).textTheme.headline3,
                onChanged: (value) =>
                    {setState(() => _sau3cur = value), init()},
              ),
              Text(
                '/',
                style: Theme.of(context).textTheme.headline2,
              ),
              NumberPicker(
                  value: _sau3max,
                  minValue: 0,
                  maxValue: 99,
                  step: 1,
                  haptics: true,
                  textStyle: Theme.of(context).textTheme.headline3,
                  onChanged: (value) =>
                      {setState(() => _sau3max = value), init()}),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );
    Widget _satScore = Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: fieldDecoration(),
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'SAT',
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                value: _satCur,
                minValue: 0,
                maxValue: 99,
                step: 1,
                haptics: true,
                textStyle: Theme.of(context).textTheme.headline3,
                onChanged: (value) => {setState(() => _satCur = value), init()},
              ),
              Text(
                '/',
                style: Theme.of(context).textTheme.headline2,
              ),
              NumberPicker(
                  value: _satMax,
                  minValue: 0,
                  maxValue: 99,
                  step: 1,
                  haptics: true,
                  textStyle: Theme.of(context).textTheme.headline3,
                  onChanged: (value) =>
                      {setState(() => _satMax = value), init()}),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );

    //_______________________

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: Icon(Icons.calculate_sharp),
        title: Text(
          'SAU SAT calculator',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              sausNum,
              Column(
                children: _sauNum == 3
                    ? [_sauScore1, _sauScore2, _sauScore3]
                    : _sauNum == 2
                        ? [_sauScore1, _sauScore2]
                        : [_sauScore1],
              ),
              passedSat,
              _passedSAT ? _satScore : SizedBox(height: 0),
              result,
              credits,
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration fieldDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.grey[850],
      boxShadow: [
        BoxShadow(
          color: Colors.black45.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2),
        ),
      ],
    );
  }
}
