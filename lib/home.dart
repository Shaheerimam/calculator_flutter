import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String _output = "0";

  String _operator = "0";

  String _input = "0";

  double num1 = 0;

  double num2 = 0;

  void _calculate(String buttonText) {
    setState(() {
      print(buttonText);
      // Logic for calculation will go here
      // This is just a placeholder for now
      if (buttonText == 'C') {
        _output = "0";
        _input = "0";
        num1 = 0;
        num2 = 0;
      } else if (buttonText == '=') {
        num2 = double.parse(_input);
        if (_operator == '+') {
          _output = (num1 + num2).toString();
        } else if (_operator == '-') {
          _output = (num1 - num2).toString();
        } else if (_operator == '*') {
          _output = (num1 * num2).toString();
        } else if (_operator == '/') {
          _output = num2 != 0
              ? (num1 / num2).toString()
              : "Error"; // Handle division by zero
        }
      } else if (['+', '-', '*', '/'].contains(buttonText)) {
        // If the button is an operator, store the operator and reset input
        _operator = buttonText;
        num1 = double.parse(_input);
        _input = '';
        print(num1);
        //_output = "0"; // Reset output for next number input
      } else {
        if (_input == "0") {
          _input = buttonText; // Start new input if it was "0"
        } else {
          _input += buttonText; // Append to existing input
        }
        _output = _input;
      }
      // Update output to show current input
      print(_output);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Calculator'),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  _output,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buttons(text: '7', onClick: () => _calculate('7')),
              buttons(text: '8', onClick: () => _calculate('8')),
              buttons(text: '9', onClick: () => _calculate('9')),
              buttons(
                text: '/',
                onClick: () => _calculate('/'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buttons(text: '4', onClick: () => _calculate('4')),
              buttons(text: '5', onClick: () => _calculate('5')),
              buttons(text: '6', onClick: () => _calculate('6')),
              buttons(
                text: '*',
                onClick: () => _calculate("*"),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buttons(text: '1', onClick: () => _calculate('1')),
              buttons(text: '2', onClick: () => _calculate('2')),
              buttons(text: '3', onClick: () => _calculate('3')),
              buttons(
                text: '-',
                onClick: () => _calculate('-'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buttons(
                text: 'C',
                onClick: () => _calculate('C'),
                color: Colors.red,
              ),
              buttons(text: '0', onClick: () => _calculate('0')),
              buttons(
                text: '=',
                onClick: () => _calculate('='),
                color: Colors.green,
              ),
              buttons(
                text: '+',
                onClick: () => _calculate('+'),
                color: Colors.orange,
              ),
            ],
          ),
          SizedBox(height: 20), // Add some space at the bottom
        ],
      ),
    );
  }
}
