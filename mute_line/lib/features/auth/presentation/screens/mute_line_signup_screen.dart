import 'package:flutter/material.dart';
import 'package:mute_line/core/utils/form_field_validators.dart';
import 'package:mute_line/core/widgets/mute_line_custom_button.dart';
import 'package:mute_line/core/widgets/mute_line_custon_text_field.dart';

class MuteLineSignupScreen extends StatefulWidget {
  const MuteLineSignupScreen({super.key});

  @override
  State<MuteLineSignupScreen> createState() => _MuteLineSignupScreenState();
}

class _MuteLineSignupScreenState extends State<MuteLineSignupScreen> {
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      // Process data.
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  "Sign up to continue to MuteLine Messenger",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black26,
                  ),
                ),
                const SizedBox(height: 30),
                MuteLineCustonTextField(
                  hintText: "Name",
                  prefixIcon: Icon(Icons.person_sharp),
                  controller: _nameController,
                  validator: validateName,
                ),
                const SizedBox(height: 20),
                MuteLineCustonTextField(
                  hintText: "Phone",
                  prefixIcon: Icon(Icons.phone),
                  controller: _phoneController,
                  validator: validatePhone,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 30),
                MuteLineCustomButton(label: "Sign Up", onTap: _handleSignUp),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signin");
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
                          const TextSpan(text: "Already have an account? "),
                          const TextSpan(
                            text: "Sign In",
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
      ),
    );
  }
}
