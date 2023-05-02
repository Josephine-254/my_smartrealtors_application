import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Realtors',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _categoryValue = 'Bedsitters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Realtors'),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Log In'),
                  value: 'login',
                ),
                PopupMenuItem(
                  child: Text('Sign In'),
                  value: 'signin',
                ),
                PopupMenuItem(
                  child: Text('Contact'),
                  value: 'contact',
                ),
              ];
            },
            onSelected: (value) {
              // TODO: Handle menu item selection
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a Category',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            DropdownButton(
              value: _categoryValue,
              items: <String>['Bedsitters', 'One Bedroom', 'Two Bedroom', 'Three Bedroom', 'Bungalow']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _categoryValue = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CategoryButton(
                    label: 'Rent',
                    onPressed: () {
                      // TODO: Navigate to rent category page
                    },
                  ),
                  CategoryButton(
                    label: 'Buy',
                    onPressed: () {
                      // TODO: Navigate to buy category page
                    },
                  ),
                  CategoryButton(
                    label: 'Project',
                    onPressed: () {
                      // TODO: Navigate to project category page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CategoryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About'),
        ),
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/background_image.jpg'),
    fit: BoxFit.cover,
    ),
    ),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    'Realtors Properties',
    )
    )
    ),
    ),
  }


