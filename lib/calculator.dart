import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    var result = "0";
    Widget button(var name) {
      return ElevatedButton(
          onPressed: () {
            setState(() {
              result = name + result;
            });
          },
          child: Text("$name"));
    }

    output() {
      Parser p = Parser();
      Expression e = p.parse(result);
      ContextModel contextModel = ContextModel();
      double eval = e.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        result = eval.toString();
      });
    }

    clear() {
      setState(() {
        result = "0";
      });
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                result,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button("1"),
                button("2"),
                button("3"),
                button("4"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button("5"),
                button("6"),
                button("7"),
                button("8"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button("9"),
                button("*"),
                button("+"),
                button("-"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button("/"),
                button("%"),
                ElevatedButton(onPressed: clear, child: Text("C")),
                ElevatedButton(onPressed: output, child: Text("=")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
