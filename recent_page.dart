// 2. RECENTS PAGE
import 'package:flutter/material.dart';
import 'package:dialer/screens/dialer.dart';

class RecentsPage extends StatelessWidget {
  const RecentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recents', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          
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
          
          Expanded(
            child: ListView(
              children: [
                _buildDateSection('Today'),
                _buildRecentCallTile('Thomas Wright', 'Mobile • 10:30 AM', Icons.call_received, Colors.green),
                _buildRecentCallTile('Sarah Parker', 'Mobile • 9:15 AM', Icons.call_missed, Colors.red),
                
                _buildDateSection('Yesterday'),
                _buildRecentCallTile('Mike Johnson', 'Mobile • May 14, 5:45 PM', Icons.call_made, Colors.blue),
                _buildRecentCallTile('Emma Wilson', 'Mobile • May 14, 3:20 PM', Icons.call_received, Colors.green),
                _buildRecentCallTile('Robert Brown', 'Mobile • May 14, 1:05 PM', Icons.call_missed, Colors.red),
                _buildRecentCallTile('Lisa Davis', 'Mobile • May 14, 11:50 AM', Icons.call_made, Colors.blue),
                _buildRecentCallTile('Chris Thompson', 'Mobile • May 14, 10:15 AM', Icons.call_received, Colors.green),
                _buildRecentCallTile('David Miller', 'Mobile • May 14, 8:40 AM', Icons.call_missed, Colors.red),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.dialpad, color: Colors.white),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>const DialerPage()),);
        },
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

  Widget _buildDateSection(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        date,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildRecentCallTile(String name, String details, IconData iconData, Color iconColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text(details),
      trailing: Icon(iconData, color: iconColor),
      onTap: () {},
    );
  }
}