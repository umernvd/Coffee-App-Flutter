// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../widgets/auth/custom_text_field.dart';
import '../../widgets/auth/auth_button.dart';
import './home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate API Call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
        // Navigate to Home
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // 2. PREVENT SQUISHING (Keeps background static when keyboard opens)
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/onboarding.png', fit: BoxFit.fill),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      // Header
                      Text(
                        "Welcome Back!",
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFC67C4E),
                            ),
                      ),
                      const SizedBox(height: 32),

                      // Email Field
                      CustomTextField(
                        label: "Email Address",
                        hint: "Enter your email",
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      CustomTextField(
                        label: "Password",
                        hint: "Enter your password",
                        controller: _passwordController,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _handleLogin,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  value: _rememberMe,
                                  activeThumbColor: Theme.of(
                                    context,
                                  ).primaryColor,
                                  trackColor: WidgetStateProperty.all(
                                    const Color(0xFFEAEAEA),
                                  ),
                                  onChanged: (val) =>
                                      setState(() => _rememberMe = val),
                                ),
                              ),
                              const Text(
                                "Remember Me",
                                style: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 12,
                                  color: Color(0xFFC67C4E),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Forgot Password Logic
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 12,
                                color: Color(0xFFC67C4E), // Primary Color
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Login Button
                      AuthButton(
                        text: "Login",
                        isLoading: _isLoading,
                        onPressed: _handleLogin,
                      ),
                      const SizedBox(height: 24),

                      // Footer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 14,
                              color: Color(0xFFA2A2A2),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Bottom Safe Area buffer
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
