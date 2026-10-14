import 'package:flutter/material.dart';

import '../models/student.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'second_screen.dart';
import 'sliver_screen.dart';

class Lab6MainScreen extends StatefulWidget {
  const Lab6MainScreen({super.key});

  @override
  State<Lab6MainScreen> createState() => _Lab6MainScreenState();
}

class _Lab6MainScreenState extends State<Lab6MainScreen> {
  int _selectedTab = 0;
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _openSecondScreen() {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a username first.')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => SecondScreen(username: username),
      ),
    );
  }

  void _openDrawerDestination(Widget screen) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => screen),
    );
  }

  void _showFabMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Floating Action Button tapped!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTitle),
        actions: [
          if (_selectedTab == 0)
            IconButton(
              tooltip: 'Add student',
              onPressed: _showFabMessage,
              icon: const Icon(Icons.person_add_alt_1),
            ),
        ],
      ),
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _buildHomeTab(),
          _buildProfileTab(),
          _buildSettingsTab(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomItem(Icons.home_rounded, 'Home', 0),
            _buildBottomItem(Icons.person_rounded, 'Profile', 1),
            const SizedBox(width: 48),
            _buildBottomItem(Icons.settings_rounded, 'Settings', 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showFabMessage,
        tooltip: 'Show message',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  String get _tabTitle => const ['Home', 'Profile', 'Settings'][_selectedTab];

  Widget _buildBottomItem(IconData icon, String label, int index) {
    return IconButton(
      tooltip: label,
      onPressed: () => setState(() => _selectedTab = index),
      icon: Icon(
        icon,
        color: _selectedTab == index
            ? Theme.of(context).colorScheme.primary
            : Colors.grey,
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Lab 6 Student'),
            accountEmail: Text('student@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.school, color: Color(0xFF3155D9)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () => _openDrawerDestination(const AboutScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail_outlined),
            title: const Text('Contact'),
            onTap: () => _openDrawerDestination(const ContactScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.view_day_outlined),
            title: const Text('SliverAppBar Demo'),
            onTap: () => _openDrawerDestination(const SliverScreen()),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Student directory',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _openSecondScreen,
                child: const Text('Open'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 110,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                _ColorCard(color: Colors.indigo, label: 'UI'),
                _ColorCard(color: Colors.teal, label: 'Lists'),
                _ColorCard(color: Colors.deepOrange, label: 'Navigation'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Students',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: sampleStudents.length,
              itemBuilder: (context, index) =>
                  StudentCard(student: sampleStudents[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 42, child: Icon(Icons.person, size: 42)),
          SizedBox(height: 12),
          Text('Lab 6 Student', style: TextStyle(fontSize: 20)),
          Text('Flutter learner'),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notifications'),
            subtitle: Text('Manage app notifications'),
            trailing: Switch(value: true, onChanged: null),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text('Appearance'),
            subtitle: Text('Light theme enabled'),
          ),
        ),
      ],
    );
  }
}

class StudentCard extends StatelessWidget {
  const StudentCard({
    required this.student,
    super.key,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(student.name.substring(0, 1)),
        ),
        title: Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${student.phone}\n${student.email}'),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class _ColorCard extends StatelessWidget {
  const _ColorCard({
    required this.color,
    required this.label,
  });

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
