import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>(),
      _email = TextEditingController(),
      _password = TextEditingController();
  bool _signUp = false, _loading = false;
  String? _error;
  Future<void> _submit(
    Future<void> Function() action, {
    bool validateForm = true,
  }) async {
    if (validateForm && !_form.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await action();
    } catch (e) {
      if (mounted)
        setState(() => _error = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Form(
              key: _form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.storefront, size: 72, color: Colors.indigo),
                  const SizedBox(height: 12),
                  Text(
                    'Campus Marketplace',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 28),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'อีเมล',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (v) => (v == null || !v.contains('@'))
                        ? 'กรุณากรอกอีเมลให้ถูกต้อง'
                        : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'รหัสผ่าน',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    validator: (v) => (v?.length ?? 0) < 6
                        ? 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร'
                        : null,
                  ),
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        _error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 18),
                  FilledButton(
                    onPressed: _loading
                        ? null
                        : () => _submit(
                            () => _signUp
                                ? AuthService().signUp(
                                    email: _email.text,
                                    password: _password.text,
                                  )
                                : AuthService().signIn(
                                    email: _email.text,
                                    password: _password.text,
                                  ),
                          ),
                    child: _loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(_signUp ? 'สมัครสมาชิก' : 'เข้าสู่ระบบ'),
                  ),
                  TextButton(
                    onPressed: _loading
                        ? null
                        : () => setState(() => _signUp = !_signUp),
                    child: Text(
                      _signUp
                          ? 'มีบัญชีแล้ว? เข้าสู่ระบบ'
                          : 'ยังไม่มีบัญชี? สมัครสมาชิก',
                    ),
                  ),
                  const Divider(height: 28),
                  OutlinedButton.icon(
                    onPressed: _loading
                        ? null
                        : () => _submit(
                            AuthService().signInWithGoogle,
                            validateForm: false,
                          ),
                    icon: const Icon(Icons.account_circle),
                    label: const Text('เข้าสู่ระบบด้วย Google'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
