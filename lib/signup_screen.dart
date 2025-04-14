import 'package:chatbot/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _signUp() {
    final String email = _emailTextController.text.trim();
    final String password = _passwordTextController.text.trim();
    final String confirmPassword = _confirmPasswordTextController.text.trim();
    final String fullName = _userNameTextController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || fullName.isEmpty) {
      _showSnackBar("Please fill all fields", Colors.orange);
      return;
    }

    if (!email.contains('@')) {
      _showSnackBar("Enter a valid email address", Colors.red);
      return;
    }

    if (password.length < 6) {
      _showSnackBar("Password must be at least 6 characters", Colors.red);
      return;
    }

    if (password != confirmPassword) {
      _showSnackBar("Passwords do not match", Colors.red);
      return;
    }

    _showSnackBar("Account created successfully (locally)", Colors.green);

    // Navigate or reset form as per your app flow
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 147, 34, 168),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("ChatterAI",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("Talk • Share • Connect",
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70)),
            ],
          ),
        ),
        toolbarHeight: 100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SigninScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Create an Account",
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 147, 34, 168))),
                const SizedBox(height: 8),
                Text("Join ChatterAI and start the conversation!",
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade700)),
                const SizedBox(height: 20),
                _buildTextField("Full Name", _userNameTextController, Icons.person),
                const SizedBox(height: 15),
                _buildTextField("Email", _emailTextController, Icons.email),
                const SizedBox(height: 15),
                _buildPasswordField("Password", _passwordTextController, _obscurePassword, () {
                  setState(() => _obscurePassword = !_obscurePassword);
                }),
                const SizedBox(height: 15),
                _buildPasswordField("Confirm Password", _confirmPasswordTextController,
                    _obscureConfirmPassword, () {
                  setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                }),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 147, 34, 168),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Sign Up',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 15),
                Text("Note: This is a local-only signup. No data is stored.",
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 147, 34, 168)),
        prefixIcon: Icon(icon, color: Color.fromARGB(255, 147, 34, 168)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromARGB(255, 147, 34, 168)),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller,
      bool obscureText, VoidCallback toggle) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 147, 34, 168)),
        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 147, 34, 168)),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggle,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromARGB(255, 147, 34, 168)),
        ),
      ),
    );
  }
}
