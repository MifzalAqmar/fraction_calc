import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _t1 = TextEditingController();
  final TextEditingController _t2 = TextEditingController();
  final TextEditingController _t3 = TextEditingController();
  final TextEditingController _t4 = TextEditingController();

  double _numeratorS=0, _numerator1=0, _numerator2=0, _denominatorS=0, _denominator1=0, _denominator2=0, _decimalS=0;
  String _select= "+";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Fraction Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fraction Calculator'),
        ),
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Row(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: <Widget>[
            Flexible(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _t1,
                decoration: InputDecoration (
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(5)
                  )
                  ),
            ),
            keyboardType: TextInputType.number
            ),
            )
            ),
            Flexible(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _t2,
                decoration: InputDecoration (
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(5)
                  )
                  ),
                  ),
            keyboardType: TextInputType.number
            ),
            )
            )
            ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text('_________________')
                    ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                         child: DropdownButton<String>(
                           value: _select,
                            items: <String>["+","-","/","*"].map<DropdownMenuItem<String>>((String sel){
                              return DropdownMenuItem<String>(
                              value: sel,
                              child: Text(sel),
                              );
                            }).toList(), onChanged: (String value) {
                              setState(() {
                                _select=value;
                              });
                            },
                         )
                         )
                         ),
                         Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text('_________________')
                    ),
                    )
                    ]
                    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Flexible(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _t3,
                decoration: InputDecoration (
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(5)
                  )
                  ),
            ),
            keyboardType: TextInputType.number
            ),
            )
            ),
            Flexible(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: TextField(
                controller: _t4,
                decoration: InputDecoration (
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(5)
                  )
                  ),
                  ),
            keyboardType: TextInputType.number
            ),
            )
            )
            ],
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: RaisedButton(
              child: Text("Calculate"),
              onPressed: _calc,
            )
            )
            ),
            Flexible(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),    
              child: RaisedButton(
              child: Text("Reset"),
              onPressed: _rst,
            ),
            ),
            )
              
              
              ]
      ),
      Padding(
        child: Text("Answer(Fractions, Decimals)"),
        padding: EdgeInsets.all(5)
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(num.parse("$_numeratorS").toStringAsFixed(2)),
              Text("_________"),
              Text(num.parse("$_denominatorS").toStringAsFixed(2),
              )
            ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
            child: Text(","),),
            Text(num.parse("$_decimalS").toStringAsFixed(2)
            )
            
          ],
          )
          )
    ]
    )
    )
    );
    }
    void _calc(){
      _numerator1=double.parse(_t1.text);
      _numerator2=double.parse(_t2.text);
      _denominator1=double.parse(_t3.text);
      _denominator2=double.parse(_t4.text);
      setState(() {
        if (_select == "+"){
          _numeratorS=_numerator1*_denominator2 + _numerator2*_denominator1;
          _denominatorS=_denominator1*_denominator2;
          _decimalS=(_numerator1/_denominator1) + (_numerator2/_denominator2);
          
        }
        else if (_select == "-"){
          _numeratorS=_numerator1*_denominator2 - _numerator2*_denominator1;
          _denominatorS=_denominator1*_denominator2;
          _decimalS=(_numerator1/_denominator1) - (_numerator2/_denominator2);
          
        }
        else if (_select == "/"){
          _numeratorS=_numerator1*_denominator2;
          _denominatorS=_numerator2*_denominator1;
          _decimalS=(_numerator1/_denominator1) / (_numerator2/_denominator2);
          
        }
        else if (_select == "*"){
          _numeratorS=_numerator1*_numerator2;
          _denominatorS=_denominator1*_denominator2;
          _decimalS=(_numerator1/_denominator1) * (_numerator2/_denominator2);
          
        }
        _convert();
      });
    }
    void _rst(){
      setState((){
        _t1.clear();
        _t2.clear();
        _t3.clear();
        _t4.clear();
        _denominatorS=0;
        _numeratorS=0;
        _decimalS=0;
      });
    }
    void _convert(){
      setState((){
        double con = nd(_numeratorS,_denominatorS);
        _numeratorS=_numeratorS/con;
        _denominatorS=_denominatorS/con;
      });
    }
    double nd(double x, double y ){
      if (x==0){
        return y;
      }
      else{
        return nd(y%x,x);
        }
    }

    }