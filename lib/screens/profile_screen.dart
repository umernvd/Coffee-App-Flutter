// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../widgets/profile/profile_field.dart';
import './login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // State Variables
  bool _isEditing = false;
  String _name = "User Name";
  String _email = "user@email.com";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // Load Data from Local Storage
  void _loadUserData() {
    // We fetch data synchronously since SharedPreferences is fast
    final storedName = StorageService().getString('user_name');
    final storedEmail = StorageService().getString('user_email');

    setState(() {
      _name = storedName ?? "Ali Hassan";
      _email = storedEmail ?? "ali.hassan@example.com";

      // Update the controllers to match the stored data
      _nameController.text = _name;
      _emailController.text = _email;
    });
  }

  // Save Data to Local Storage
  void _saveUserData() {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Fields cannot be empty"),
          backgroundColor: Color(0xFFC67C4E),
        ),
      );
      return;
    }

    // Persist to storage
    StorageService().setString('user_name', _nameController.text.trim());
    StorageService().setString('user_email', _emailController.text.trim());

    setState(() {
      _name = _nameController.text.trim();
      _email = _emailController.text.trim();
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile updated successfully"),
        backgroundColor: Color(0xFFC67C4E), // Primary Orange
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Logout Logic
  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Logout",
          style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Are you sure you want to logout?",
          style: TextStyle(fontFamily: 'Sora'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Sora'),
            ),
          ),
          TextButton(
            onPressed: () {
              // Clear stack and go to Login
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Color(0xFFC67C4E),
                fontFamily: 'Sora',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFC67C4E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Sora',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFFC67C4E),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_isEditing) {
                _saveUserData();
              } else {
                setState(() => _isEditing = true);
              }
            },
            icon: Icon(
              _isEditing ? Icons.check : Icons.edit_outlined,
              color: const Color(0xFFC67C4E),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            // Avatar Section
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFFC67C4E),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Profile Fields
            ProfileField(
              label: "Full Name",
              currentValue: _name,
              controller: _nameController,
              isEditing: _isEditing,
            ),
            const SizedBox(height: 24),
            ProfileField(
              label: "Email Address",
              currentValue: _email,
              controller: _emailController,
              isEditing: false,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 60),

            // Logout Button (Styled to match 'Order' Button)
            SizedBox(
              width: double.infinity,
              height: 62,
              child: ElevatedButton(
                onPressed: _handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFFC67C4E,
                  ), // Primary Coffee Color
                  elevation: 0, // Flat look
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
