import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _mockLogin() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  void _mockGoogleSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/ChatterAI.png',
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Welcome to ChatterAI",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: _mockGoogleSignIn,
              icon: Image.asset('assets/google_icon.png', height: 24),
              label: Text("Sign in with Google"),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _mockLogin,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 147, 34, 168),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
