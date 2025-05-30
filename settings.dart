// 4. SETTINGS PAGE
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Call Assist'),
          _buildSettingsTile(Icons.call, 'Caller ID and spam'),
          
          _buildSectionTitle('General'),
          _buildSettingsTile(Icons.accessibility, 'Accessibility'),
          _buildSettingsTile(Icons.dialpad, 'Assisted dialing'),
          _buildSettingsTile(Icons.block, 'Blocked numbers'),
          _buildSettingsTile(Icons.account_circle, 'Calling accounts'),
          _buildSettingsTile(Icons.fiber_manual_record, 'Call recording'),
          _buildSettingsTile(Icons.visibility, 'Display options'),
          _buildSettingsTile(Icons.message, 'Quick responses'),
          _buildSettingsTile(Icons.volume_up, 'Sounds and vibration'),
          _buildSettingsTile(Icons.voicemail, 'Voicemail'),
          _buildSettingsTile(Icons.music_note, 'Contact ringtones'),
          
          _buildSectionTitle('Advanced'),
          _buildSettingsTile(Icons.announcement, 'Caller ID announcement'),
          _buildSettingsTile(Icons.screen_rotation, 'Flip to silence'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blue[700],
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget _buildSettingsTile(IconData iconData, String title) {
    return ListTile(
      leading: Icon(iconData, color: Colors.grey[600]),
      title: Text(title),
      onTap: () {},
    );
  }
}