// FAVOURITES PAGE 
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
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
                  hintText: 'Search favourites',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.mic),
                ),
              ),
            ),
          ),
          // Favourites List
          Expanded(
            child: ListView(
              children: [
                _buildFavouriteContactTile('Mom', '+1 555-1111', Colors.red[100]!),
                _buildFavouriteContactTile('Dad', '+1 555-2222', Colors.blue[100]!),
                _buildFavouriteContactTile('Home', '+1 555-3333', Colors.green[100]!),
                _buildFavouriteContactTile('Partner', '+1 555-4444', Colors.purple[100]!),
                _buildFavouriteContactTile('Best Friend', '+1 555-5555', Colors.orange[100]!),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
    );
  }

  Widget _buildFavouriteContactTile(String name, String number, Color avatarColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text(number),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.message, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
