import 'package:flutter/material.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget _buildAppBar(String title) {
    return AppBar(
      titleSpacing: 20.0,
      title: Text(title),
      backgroundColor: Colors.white,
      elevation: 0.0,
      shape: const ContinuousRectangleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      // Widget untuk halaman Home
      SingleChildScrollView(
        child: Column(
          children: [
            // Banner Image
            Image.asset(
              'assets/banner.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),
            // Persegi panjang dengan tulisan "Hello, Marvel" dan logo ambulance
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // Tulisan "Hello, Marvel"
                  Text('Hello, Marvel'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 22.0, // Jarak horizontal antar widget
              children: [
                _buildSquareButtonWithText('       Book\nAppointment',
                    'booking appointment page', 'assets/Book-Btn.png'),
                _buildSquareButtonWithText(
                    'Articles', 'view articles page', 'assets/News-Btn.png'),
                _buildSquareButtonWithText(
                    'Lab Tests', 'lab tests page', 'assets/Lab-Btn.png'),
                _buildSquareButtonWithText('     Online\nConsultation',
                    'online consultation page', 'assets/Consultation-Btn.png'),
              ],
            ),

            // Title sebelum gridview artikel
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Latest Article',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12.0),
            // Artikel menggunakan ListView
            Container(
              height: 160, // Specify a fixed height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Ganti dengan jumlah artikel yang ada
                itemBuilder: (context, index) {
                  return Container(
                    width: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 99, 154),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          child: Image.asset(
                            'assets/article.png',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Article Title',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Article Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Widget untuk halaman Appointments
      const Center(
        child: Text(
          'Index 1: Appointments',
          style: optionStyle,
        ),
      ),
      // Widget untuk halaman Records
      const Center(
        child: Text(
          'Index 2: Records',
          style: optionStyle,
        ),
      ),
      // Widget untuk halaman Transactions
      const Center(
        child: Text(
          'Index 3: Transactions',
          style: optionStyle,
        ),
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Tinggi header baru
        child: Stack(
          children: [
            // Home Page AppBar
            if (_selectedIndex == 0)
              Container(
                padding: const EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 5.0,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: AppBar(
                  actions: [
                    IconButton(
                      padding: const EdgeInsets.only(right: 10.0),
                      iconSize: 34,
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        // Handle notification button tap
                      },
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(right: 20.0),
                      iconSize: 34,
                      icon: const Icon(Icons.account_circle),
                      onPressed: () {
                        // Handle profile button tap
                      },
                    ),
                  ],
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                        'assets/hospital_logo.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
              ),

            // Selected Tab AppBar
            if (_selectedIndex != 0)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 5.0,
                      offset: const Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: _buildAppBar(
                  _selectedIndex == 1
                      ? 'Appointments'
                      : _selectedIndex == 2
                          ? 'Records'
                          : _selectedIndex == 3
                              ? 'Transactions'
                              : '',
                ),
              ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 5.0,
              offset: const Offset(0.0, -4.0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Records',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Transactions',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }

  Widget _buildSquareButtonWithText(
      String buttonText, String navigationText, String imagePath) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigate to the specified page
            print(navigationText);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 62,
              width: 62,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          buttonText,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
