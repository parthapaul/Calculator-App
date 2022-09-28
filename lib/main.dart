import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var txtOne = TextEditingController();
  var txtTwo = TextEditingController();
  var ans = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String sMode = "debug mode";
    if (kReleaseMode) {
      sMode = 'release mode';
    }
    return Scaffold(
        appBar: AppBar(title: const Text("Calculator")),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 20,
                    alignment: Alignment.center,
                    child: Text(sMode),
                  ),
                  Row(
                    children: [

                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 16, right: 8, bottom: 16),
                        // color: Colors.red,
                        child: TextField(
                          controller: txtOne,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 8, right: 16, bottom: 16),
                        // color: Colors.green,
                        child: TextField(
                          controller: txtTwo,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                      )),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 16, right: 8, bottom: 16),
                    // color: Colors.red,
                    child: TextField(
                      controller: ans,
                      readOnly: true, // "true" or "false"
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 16, right: 8, bottom: 16),
                              // color: Colors.red,
                              child: ElevatedButton(
                                onPressed: () => cal("add"),
                                child: const Text('+'),
                              ))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 16, right: 8, bottom: 16),
                              // color: Colors.red,
                              child: ElevatedButton(
                                onPressed: () => cal("sub"),
                                child: const Text('-'),
                              ))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 16, right: 8, bottom: 16),
                              // color: Colors.red,
                              child: ElevatedButton(
                                onPressed: () => cal("mul"),
                                child: const Text('*'),
                              ))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 16, right: 8, bottom: 16),
                              // color: Colors.red,
                              child: ElevatedButton(
                                onPressed: () => cal("div"),
                                child: const Text('/'),
                              ))),
                    ],
                  ),
                  // ElevatedButton(
                  //   onPressed: () => cal(),
                  //   child: const Text('='),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }

//partha
  cal(String sName) {
    String sAns = "";
    if (txtOne.text.isNotEmpty && txtTwo.text.isNotEmpty) {
      setState(() {
        switch (sName) {
          case "add":
            sAns = (int.parse(txtOne.text) + int.parse(txtTwo.text)).toString();
            break;
          case "sub":
            sAns = (int.parse(txtOne.text) - int.parse(txtTwo.text)).toString();
            break;
          case "mul":
            sAns = (int.parse(txtOne.text) * int.parse(txtTwo.text)).toString();
            break;
          case "div":
            sAns = (int.parse(txtOne.text) / int.parse(txtTwo.text)).toString();
            break;
        }
        ans.text = sAns;
      });
    }
  }
}
