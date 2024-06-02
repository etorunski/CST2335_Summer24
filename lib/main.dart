import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  String _imageSource = 'images/question-mark.png';
  final _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final hasCredentials = prefs.getBool('hasCredentials') ?? false;

    if (hasCredentials) {
      final username = await _secureStorage.read(key: 'username');
      final password = await _secureStorage.read(key: 'password');

      if (username != null && password != null) {
        _loginController.text = username;
        _passwordController.text = password;

        final snackBar = SnackBar(
          content: const Text('Previous login credentials loaded.'),
          action: SnackBarAction(
            label: 'Clear Saved Data',
            onPressed: () {
              _loginController.clear();
              _passwordController.clear();
              _secureStorage.delete(key: 'username');
              _secureStorage.delete(key: 'password');
              prefs.setBool('hasCredentials', false);
            },
          ),
          duration: const Duration(seconds: 1000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future<void> _handleLogin() async {
    final password = _passwordController.text;
    if (password == 'QWERTY123') {
      setState(() {
        _imageSource = 'images/idea.png';
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Save Login Credentials'),
          content: const Text('Would you like to save your username and password for next time?'),
          actions: [
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('hasCredentials', false);
                await _secureStorage.delete(key: 'username');
                await _secureStorage.delete(key: 'password');
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('hasCredentials', true);

                final username = _loginController.text;
                await _secureStorage.write(key: 'username', value: username);
                await _secureStorage.write(key: 'password', value: password);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _imageSource = 'images/stop.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Login name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            Image.asset(
              _imageSource,
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}