import 'package:flutter/material.dart';

import 'P01.dart';
import 'P02.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Tạo controller cho các trường nhập liệu
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Tạo GlobalKey để xác nhận form
  final _formKey = GlobalKey<FormState>();

  // Hàm xử lý đăng nhập
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Xử lý đăng nhập ở đây
      String email = _emailController.text;
      String password = _passwordController.text;

      // In ra email và mật khẩu
      print('Đăng nhập với email: $email, Mật khẩu: $password');

      // Sau khi đăng nhập thành công, chuyển đến trang chủ
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Gắn GlobalKey cho form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Trường nhập email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  } else if (!value.endsWith('@gmail.com')) {
                    return 'Email phải có đuôi @gmail.com';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Trường nhập mật khẩu
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Ẩn mật khẩu
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  } else if (value.length < 6) {
                    return 'Mật khẩu phải có ít nhất 6 ký tự';
                  } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(value)) {
                    return 'Mật khẩu phải có ít nhất một chữ cái và một chữ số';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),

              // Nút đăng nhập
              ElevatedButton(
                onPressed: _login,
                child: const Text('Đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(), // Màn hình Trang chủ
    const ProfilePage(), // Component Hồ sơ
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hồ sơ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

