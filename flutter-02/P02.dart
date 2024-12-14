import 'package:flutter/material.dart';

import 'P01.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Biến điều khiển việc hiển thị hình ảnh
  bool _isImageVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(9.0),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 9.0),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.U0D5JdoPkQMi4jhiriSVsgHaHa?rs=1&pid=ImgDetMain',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    'Bài viết ${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Mô tả ngắn gọn về bài viết ${index + 1}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    // Hiển thị hình ảnh khi người dùng tap vào bài viết
                    setState(() {
                      _isImageVisible = true;
                    });
                  },
                ),
              );
            },
          ),
          // Hình ảnh sẽ xuất hiện ở trên cùng khi tap vào bài viết
          if (_isImageVisible)
            Positioned(
              top: 100,
              left: 200,
              right: 200,
              child: GestureDetector(
                onTap: () {
                  // Ẩn hình ảnh khi người dùng bấm vào hình ảnh
                  setState(() {
                    _isImageVisible = false;
                  });
                },
                child: Container(
                  width: 480,
                  height: 480,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.U0D5JdoPkQMi4jhiriSVsgHaHa?rs=1&pid=ImgDetMain',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          // Nút quay về trang chủ
          if (_isImageVisible)
            Positioned(
              top: 600,
              left: 120,
              child: ElevatedButton(
                onPressed: () {
                  // Quay lại trang chủ khi nhấn nút
                  setState(() {
                    _isImageVisible = false;
                  });
                },
                child: const Text('Quay về trang chủ'),
              ),
            ),
        ],
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