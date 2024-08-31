import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Flutter Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return mobileLayout();
          } else if (constraints.maxWidth < 1200) {
            // Tablet layout
            return tabletLayout();
          } else {
            // Desktop layout
            return desktopLayout();
          }
        },
      ),
    );
  }

  Widget mobileLayout() {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: const [
          Text(
            'Mobile Layout    ',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FLUTTER WEB.\n THE BASICS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 6,
                padding: const EdgeInsets.only(left: 50, right: 50),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))),
              ),
              onPressed: () {},
              child: const Text(
                'Join Meeting',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablet Layout'),
        actions: const [
          Row(
            children: [
              Text(
                'Explore',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '       About     ',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'FLUTTER WEB.\n THE BASICS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 20),
              const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 6,
                  padding: const EdgeInsets.all(20),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                ),
                onPressed: () {},
                child: const Text(
                  'Join Meeting',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desktop Layout'),
        actions: const [
          Row(
            children: [
              Text(
                'Explore',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '       About     ',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'FLUTTER WEB.\n THE BASICS',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 6,
                  padding: const EdgeInsets.all(20),
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                ),
                onPressed: () {},
                child: const Text(
                  'Join Meeting',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
