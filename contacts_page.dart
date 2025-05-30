// 3. CONTACTS PAGE
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search contacts',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.mic),
                ),
              ),
            ),
          ),
        
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip('All', true),
                _buildFilterChip('Missed', false),
                _buildFilterChip('Contacts', false),
                _buildFilterChip('Non-spam', false),
                _buildFilterChip('Spam', false),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Contact List
          Expanded(
            child: ListView(
              children: [
                _buildContactHeader('A'),
                _buildContactTile('Alice Anderson', '+1 555-1234'),
                _buildContactTile('Aaron Adams', '+1 555-5678'),
                
                _buildContactHeader('B'),
                _buildContactTile('Bob Brown', '+1 555-2468'),
                _buildContactTile('Bella Bennett', '+1 555-1357'),
                
                _buildContactHeader('C'),
                _buildContactTile('Chris Cooper', '+1 555-3690'),
                _buildContactTile('Catherine Clark', '+1 555-2580'),
                
                _buildContactHeader('D'),
                _buildContactTile('David Davis', '+1 555-1470'),
                _buildContactTile('Diana Dawson', '+1 555-3698'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.dialpad, color: Colors.white),
        onPressed: () {},
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        selectedColor: Colors.blue[100],
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildContactHeader(String letter) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.grey[100],
      child: Text(
        letter,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildContactTile(String name, String number) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text(number),
      trailing: const Icon(Icons.call, color: Colors.blue),
      onTap: () {},
    );
  }
}
