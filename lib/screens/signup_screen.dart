// ignore_for_file: deprecated_member_use

import 'package:coffee_app/screens/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/auth/auth_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool _isLoading = false;
  bool _termsAccepted = false;

  void _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      if (!_termsAccepted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You must agree to the terms to proceed", textAlign: TextAlign.center),
            backgroundColor: Color(0xFFC67C4E),
          ),
        );
        return;
      }

      setState(() => _isLoading = true);
      // Simulate API
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainWrapper()));

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFC67C4E)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFC67C4E),
                      ),
                    ),
                    const SizedBox(height: 32),

                    CustomTextField(
                      label: "Full Name",
                      hint: "Enter your name",
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validator: (val) => val != null && val.isNotEmpty
                          ? null
                          : "Please enter your name",
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      label: "Email Address",
                      hint: "Enter your email",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => val != null && val.contains('@')
                          ? null
                          : "Please enter a valid email",
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      label: "Password",
                      hint: "Create a password",
                      controller: _passwordController,
                      isPassword: true,
                      validator: (val) => val != null && val.length >= 6
                          ? null
                          : "Password must be at least 6 characters",
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      label: "Confirm Password",
                      hint: "Re-enter password",
                      controller: _confirmPassController,
                      isPassword: true,
                      validator: (val) {
                        if (val != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Terms Checkbox
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: _termsAccepted,
                            activeColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (val) =>
                                setState(() => _termsAccepted = val ?? false),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: GoogleFonts.sora().fontFamily,
                                fontSize: 12,
                                color: const Color(0xFF000000),
                              ),
                              children: [
                                const TextSpan(text: "I agree to the "),
                                TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(text: " and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    AuthButton(
                      text: "Sign Up",
                      isLoading: _isLoading,
                      onPressed: _handleSignup,
                    ),
                    const SizedBox(height: 24),

                    // Login Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontFamily: GoogleFonts.sora().fontFamily,
                            fontSize: 14,
                            color: const Color(0xFF000000),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: GoogleFonts.sora().fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
