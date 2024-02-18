import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'iOS calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String display = '0';
  double firstOperand = 0;
  String operation = '';
  bool isOperationPressed = false;

  void handleACPress() {
    setState(() {
      display = '0'; // Reset display to '0'
      firstOperand = 0; // Reset firstOperand
      operation = ''; // Reset operation
      isOperationPressed = false; // Reset isOperationPressed flag
    });
  }


  void handleNumberPress(String value) {
    if (isOperationPressed) {
      setState(() {
        display = value;
        isOperationPressed = false;
      });
    } else {
      setState(() {
        display = display == '0' ? value : display + value;
      });
    }
  }

  void handleOperationPress(String value) {
    if (operation.isNotEmpty) {
      calculateResult();
    } else {
      setState(() {
        firstOperand = double.parse(display);
        operation = value;
        isOperationPressed = true;
      });
    }
  }

  void calculateResult() {
    double secondOperand = double.parse(display);
    double result = 0;
    switch (operation) {
      case '+':
        result = firstOperand + secondOperand;
        break;
      case '-':
        result = firstOperand - secondOperand;
        break;
      case '*':
        result = firstOperand * secondOperand;
        break;
      case '/':
        if (secondOperand != 0) {
          result = firstOperand / secondOperand;
        } else {
          // Handle division by zero error
          result = double.nan;
        }
        break;
    }
    setState(() {
      display = result.toString();
      firstOperand = result;
      operation = '';
      isOperationPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  display,
                  style: TextStyle(fontSize: 80, color: Colors.white),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    handleACPress(); // Call handleACPress when "AC" button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    'AC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleOperationPress('+/-'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '+/-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleOperationPress('%'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleOperationPress('/'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: const CircleBorder(),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '/',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Set SizedBox height to 8 pixels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => handleNumberPress('7'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '7',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleNumberPress('8'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleNumberPress('9'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleOperationPress('*'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: const CircleBorder(),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '*',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Set SizedBox height to 8 pixels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => handleNumberPress('4'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleNumberPress('5'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleNumberPress('6'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleOperationPress('-'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: const CircleBorder(),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Set SizedBox height to 8 pixels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => handleNumberPress('1'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleNumberPress('2'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleNumberPress('3'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => handleOperationPress('+'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: const CircleBorder(),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Set SizedBox height to 8 pixels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => handleNumberPress('0'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    fixedSize: const Size(195, 90), // Set fixed size
                  ),
                  child: const Text(
                    '0',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(width: 0,),
                ElevatedButton(
                  onPressed: () => handleNumberPress('.'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(80, 80, 80, 1.0),
                    shape: const CircleBorder(),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calculateResult(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: const CircleBorder(),
                    fixedSize: const Size(90, 90), // Set fixed size
                  ),
                  child: const Text(
                    '=',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
