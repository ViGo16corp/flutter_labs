import 'package:flutter/material.dart';
import 'package:my_project/routes/app_routes.dart';
import 'package:my_project/widgets/auth_layout.dart';
import 'package:my_project/widgets/custom_text_field.dart';
import 'package:my_project/widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  bool get _canSubmit =>
      _email.text.trim().isNotEmpty &&
      _password.text.trim().isNotEmpty &&
      _confirm.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _email.addListener(_rebuild);
    _password.addListener(_rebuild);
    _confirm.addListener(_rebuild);
  }

  void _rebuild() => setState(() {});

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Create account 🌱',
      subtitle: 'Simple UI now — logic in next labs.',
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
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Confirm password',
            hint: '••••••••',
            obscureText: true,
            controller: _confirm,
          ),
          const SizedBox(height: 22),
          PrimaryButton(
            text: 'Register',
            onPressed: _canSubmit
                ? () => Navigator.pushNamed(context, AppRoutes.home)
                : null,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back to login'),
          ),
        ],
      ),
    );
  }
}
