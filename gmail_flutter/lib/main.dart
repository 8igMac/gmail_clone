import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // 調整主題色系
        colorSchemeSeed: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final String _imageAddr =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        height: 60,
        // 隱藏提示字 (可以把這個參數拿掉實驗看看效果)
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.mail_outline),
            selectedIcon: Icon(Icons.mail),
            label: 'mail',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.group_outlined),
            selectedIcon: Icon(Icons.group),
            label: 'group',
          ),
          NavigationDestination(
            icon: Icon(Icons.videocam_outlined),
            selectedIcon: Icon(Icons.videocam),
            label: 'video call',
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Search'),
        elevation: 22,
        // 使 AppBar 有圓角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // 控制圓角半徑
        ),
        actions: [
          CircleAvatar(
            // backgroundImage: NetworkImage(_imageAddr),
            backgroundImage: AssetImage('images/batman.png'),
          ),
          // 留一個寬度為 10 的空白
          const SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            Padding(
              // 四周留空白
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Gmail",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.star_outline,
                color: Colors.black,
              ),
              title: Text('已加星號'),
              trailing: Text('2'),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              title: Text('已延後'),
              trailing: Text('2'),
            ),
            ListTile(
              leading: Icon(
                Icons.move_to_inbox,
                color: Colors.black,
              ),
              title: Text('收件夾'),
              trailing: Text('2'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, i) {
          return ListTile(
            // 留空白
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(_imageAddr),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Title'),
                Text("3月8號"),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      'subtitlasdfsdfadsfe',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'subtitlasdfsdfadsfe',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Icon(Icons.star_outline),
              ],
            ),
          );
        },
      ),
      floatingActionButton: const FloatingActionButton.extended(
        icon: Icon(Icons.edit_outlined),
        label: Text('Edit'),
        onPressed: null,
        // 控制 Icon 與 Label 間距
        extendedIconLabelSpacing: 30,
        // 控制兩邊空白
        extendedPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
