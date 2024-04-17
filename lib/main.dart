import 'package:calculator/const.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              centerTitle: true,
              titleTextStyle: TextStyle(color: Colors.grey)),
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: MyCalculator());
  }
}

class MyCalculator extends StatefulWidget {
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String firstnum = "";
  String secondnum = "";
  String result = "";
  String operator = "";

  void onbtnPressed(String s) {
    if (operator.isEmpty) {
      setState(() {
        firstnum = firstnum + s;
      });
    } else {
      setState(() {
        secondnum = secondnum + s;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'CALCULATOR',
        style: TextStyle(fontSize: 20),
      )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    '$firstnum $operator $secondnum ${result.isEmpty ? '' : '='} $result',
                    style: koutput),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                ResuableButton(
                  onTap: () {
                    onbtnPressed("7");
                  },
                  text: "7",
                ),
                ResuableButton(
                  onTap: () {
                    onbtnPressed("8");
                  },
                  text: "8",
                ),
                ResuableButton(
                  onTap: () {
                    onbtnPressed("9");
                  },
                  text: "9",
                ),
                ResuableButton(
                  onTap: () {
                    operator = "+";
                    secondnum = "";
                    setState(() {});
                  },
                  text: "+",
                ),
              ],
            )),
            Expanded(
              child: Row(children: [
                ResuableButton(onTap: () {}, text: "4"),
                ResuableButton(
                  onTap: () {
                    onbtnPressed("5");
                  },
                  text: "5",
                ),
                ResuableButton(
                  onTap: () {
                    onbtnPressed("6");
                  },
                  text: "6",
                ),
                ResuableButton(
                  onTap: () {
                    operator = "-";
                    secondnum = "";
                    setState(() {});
                  },
                  text: "-",
                )
              ]),
            ),
            Expanded(
                child: Row(
              children: [
                ResuableButton(
                  onTap: () {
                    onbtnPressed("1");
                  },
                  text: "1",
                ),
                ResuableButton(
                  onTap: () {
                    onbtnPressed("2");
                  },
                  text: "2",
                ),
                ResuableButton(
                  onTap: () {
                    onbtnPressed("3");
                  },
                  text: "3",
                ),
                ResuableButton(
                  onTap: () {
                    onbtnPressed("0");
                  },
                  text: "0",
                )
              ],
            )),
            InkWell(
              onTap: () {
                if (operator == "+") {
                  setState(() {
                    result =
                        (int.parse(firstnum) + int.parse(secondnum)).toString();
                  });
                } else if (operator == "-") {
                  setState(() {
                    result =
                        (int.parse(firstnum) - int.parse(secondnum)).toString();
                  });
                }
              },
              child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  child: const Center(
                      child: Text('CALCULATE',
                          style:
                              TextStyle(fontSize: 20, color: Colors.yellow)))),
            )
          ],
        ),
      ),
    );
  }
}

class ResuableButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  ResuableButton({required this.text, required this.onTap});
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Container(
          margin: kmarginCalculator,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: Text(text, style: kButtonCalculator))),
    ));
  }
}
