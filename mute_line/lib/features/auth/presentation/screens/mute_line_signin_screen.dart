import 'package:flutter/material.dart';
import 'package:mute_line/core/utils/form_field_validators.dart';
import 'package:mute_line/core/widgets/mute_line_custom_button.dart';
import 'package:mute_line/core/widgets/mute_line_custon_text_field.dart';

class MuteLineSigninScreen extends StatefulWidget {
  const MuteLineSigninScreen({super.key});

  @override
  State<MuteLineSigninScreen> createState() => _MuteLineSigninScreenState();
}

class _MuteLineSigninScreenState extends State<MuteLineSigninScreen> {
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                "Sign in to continue to MuteLine Messenger",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 30),
              MuteLineCustonTextField(
                hintText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
                controller: _emailController,
                validator: validateEmail,
              ),
              const SizedBox(height: 20),
              MuteLineCustonTextField(
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
                hintText: "Password",
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                validator: validatePassword,
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MuteLineCustomButton(
                label: "Login",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        const TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
