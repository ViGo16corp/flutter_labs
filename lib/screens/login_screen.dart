import 'package:flutter/material.dart';
import 'package:my_project/routes/app_routes.dart';
import 'package:my_project/widgets/auth_layout.dart';
import 'package:my_project/widgets/custom_text_field.dart';
import 'package:my_project/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool get _canSubmit =>
      _email.text.trim().isNotEmpty && _password.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _email.addListener(_rebuild);
    _password.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Welcome back 🌿',
      subtitle: 'Log in to continue caring for your plants.',
      child: Column(
        children: [
          CustomTextField(
            label: 'Email',
            hint: 'you@example.com',
            controller: _email,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Password',
            hint: '••••••••',
            obscureText: true,
            controller: _password,
          ),
          const SizedBox(height: 22),
          PrimaryButton(
            text: 'Log in',
            onPressed: _canSubmit
                ? () => Navigator.pushNamed(context, AppRoutes.home)
                : null,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.register),
            child: const Text('Create account'),
          ),
        ],
      ),
    );
  }
}
