import 'package:flutter/material.dart';
import 'package:loginform_demo/profile.dart';
import 'package:loginform_demo/video_player_screen.dart';
import 'package:loginform_demo/playlist.dart'; // Ensure this import is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Set the initial page to HomePage
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    Playlist(), // Link to Playlist widget
    Profile(), // Your Profile widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back arrow
        backgroundColor: Color.fromARGB(255, 174, 20, 20),
        title: Text(_selectedIndex == 0 ? 'Home' : _selectedIndex == 1 ? 'Playlist' : 'Profile'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Playlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 122, 17, 17),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back arrow
        backgroundColor: Color.fromARGB(255, 174, 20, 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100), // Add some space from the top
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'This is where magic is made.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerScreen()),
                );
              },
              child: Text('Beat of the Day'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 174, 20, 20), // Button color
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.black, // Set the line color
              thickness: 2, // Set the line thickness
            ),
            SizedBox(height: 20),
            Text(
              'Continue Listening',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            // Wrap with custom texts
            Expanded(
              child: Wrap(
                spacing: 10, // Horizontal space between items
                runSpacing: 10, // Vertical space between items
                children: List.generate(3, (index) {
                  final texts = [
                    '"SkyFall"',
                    '"Undertone"',
                    '"Money Trees"',
                  ]; // Custom texts for each item

                  return Container(
                    width: (MediaQuery.of(context).size.width - 40) / 3, // Dynamic width for each item
                    height: 100, // Fixed height for each item
                    child: Card(
                      child: Center(
                        child: Text(texts[index]),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Wrap with custom button texts
            SizedBox(height: 10,),
            Wrap(
              spacing: 10, // Horizontal space between items
              children: List.generate(3, (index) {
                final buttonTexts = [
                  'See More 1',
                  'See More 2',
                  'See More 3',
                ]; // Custom texts for each button

                return ElevatedButton(
                  onPressed: () {
                    // Add your onPressed functionality here
                  },
                  child: Text(buttonTexts[index]),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 174, 20, 20), // Button color
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}