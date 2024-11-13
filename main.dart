import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personalized Greeting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GreetingScreen(),
    );
  }
}

class GreetingScreen extends StatefulWidget {
  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  // TextEditingController to manage the text input
  TextEditingController _controller = TextEditingController();
  
  // Variable to hold the greeting message
  String _greetingMessage = '';

  // Function to handle the button press and update the greeting
  void _showGreeting() {
    String name = _controller.text.trim();  // Get the name from the TextField

    if (name.isEmpty) {
      // Show an alert dialog if the name is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Input Error'),
            content: Text('Please enter your name to show the greeting.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();  // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Update the greeting message
      setState(() {
        _greetingMessage = 'Hello, $name!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalized Greeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // TextField to enter the user's name
            Container(
              width: 250, // Set a standard width for the TextField
              child: TextField(
                controller: _controller, // Connect the TextField to the controller
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Button to trigger the greeting
            ElevatedButton(
              onPressed: _showGreeting,
              child: Text('Show Greeting'),
            ),
            
            SizedBox(height: 20),
            
            // Display the greeting message if it exists
            if (_greetingMessage.isNotEmpty)
              Text(
                _greetingMessage,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
