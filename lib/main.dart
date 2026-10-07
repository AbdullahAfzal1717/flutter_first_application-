import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Contact {
  const Contact({
    required this.name,
    required this.phoneNumber,
  });

  final String name;
  final String phoneNumber;

  String get firstLetter => name.substring(0, 1).toUpperCase();
}

const contacts = <Contact>[
  Contact(name: 'Aarav Sharma', phoneNumber: '+91 98765 43210'),
  Contact(name: 'Emily Johnson', phoneNumber: '+1 202 555 0147'),
  Contact(name: 'Fatima Khan', phoneNumber: '+91 91234 56789'),
  Contact(name: 'James Wilson', phoneNumber: '+44 20 7946 0958'),
  Contact(name: 'Maya Patel', phoneNumber: '+91 99887 76655'),
  Contact(name: 'Noah Williams', phoneNumber: '+1 415 555 0182'),
  Contact(name: 'Olivia Brown', phoneNumber: '+61 2 5550 1234'),
  Contact(name: 'Rohan Mehta', phoneNumber: '+91 87654 32109'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3155D9),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        useMaterial3: true,
      ),
      home: const ContactsPage(),
    );
  }
}

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  void _showCallMessage(BuildContext context, Contact contact) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Calling ${contact.name} at ${contact.phoneNumber}'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'Search contacts',
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Text(
              '${contacts.length} contacts',
              style: TextStyle(
                color: Color(0xFF697386),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ContactTile(
                  contact: contact,
                  onCall: () => _showCallMessage(context, contact),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add contact',
        onPressed: () {},
        child: const Icon(Icons.person_add_alt_1_rounded),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({
    required this.contact,
    required this.onCall,
    super.key,
  });

  final Contact contact;
  final VoidCallback onCall;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFFF1F3F8),
          child: Text(
            contact.firstLetter,
            style: const TextStyle(
              color: Color(0xFF3155D9),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        title: Text(
          contact.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            contact.phoneNumber,
            style: const TextStyle(
              color: Color(0xFF697386),
              fontSize: 14,
            ),
          ),
        ),
        trailing: IconButton(
          tooltip: 'Call ${contact.name}',
          onPressed: onCall,
          icon: const Icon(Icons.call_rounded),
          color: const Color(0xFF3155D9),
        ),
      ),
    );
  }
}
