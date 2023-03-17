import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  String _imageAddr =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.mail_outline),
            label: 'mail',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.group_outlined),
            label: 'group',
          ),
          NavigationDestination(
            icon: Icon(Icons.videocam_outlined),
            label: 'video call',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(_imageAddr),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Text(
              "Gmail",
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
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_imageAddr),
            ),
            title: Row(
              children: [
                Text('Title'),
                Text("3月8號"),
              ],
            ),
            subtitle: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'subtitlasdfsdfadsfe',
                    ),
                    Text(
                      'subtitlasdfsdfadsfe',
                    ),
                  ],
                ),
                Icon(Icons.star_outline),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.edit_outlined),
        label: Text('Edit'),
        onPressed: null,
      ),
    );
  }
}