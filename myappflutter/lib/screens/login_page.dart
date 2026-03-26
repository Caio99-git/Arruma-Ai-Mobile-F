import 'package:flutter/material.dart';
import 'report_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _estaCarregando = false;
  bool _mostrarSenha = false;

  void _fazerLogin() {
    setState(() => _estaCarregando = true);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _estaCarregando = false);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReportPage()),
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF7A7A7A),
        fontSize: 16,
      ),
      filled: true,
      fillColor: const Color(0xFFF4F1F2),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 22,
      ),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFF34A853),
          width: 1.2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color(0xFF34A853),
          width: 1.8,
        ),
      ),
    );
  }

  Widget _socialButton({
    required String imagePath,
    required String texto,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 270,
      height: 62,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFBDBDBD)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 34,
              height: 34,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.account_circle, color: Colors.grey, size: 34);
              },
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                texto,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 34),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Arruma-Ai',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 56),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'E-mail:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _inputDecoration(
                      hintText: 'seuemail@exemplo.com',
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Senha:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _senhaController,
                    obscureText: !_mostrarSenha,
                    decoration: _inputDecoration(
                      hintText: 'Digite sua senha',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _mostrarSenha = !_mostrarSenha;
                          });
                        },
                        icon: Icon(
                          _mostrarSenha
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: const Color(0xFF34A853),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueci a senha',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('|', style: TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: 220,
                    height: 62,
                    child: ElevatedButton(
                      onPressed: _estaCarregando ? null : _fazerLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF34A853),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: _estaCarregando
                          ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                          : const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _socialButton(
                    imagePath: 'assets/google.png',
                    texto: 'Continue com Google',
                    onTap: () {},
                  ),
                  const SizedBox(height: 18),
                  _socialButton(
                    imagePath: 'assets/apple.png',
                    texto: 'Continue com Apple',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}