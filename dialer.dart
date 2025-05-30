// 1. DIALER PAGE
import 'package:flutter/material.dart';
import 'package:dialer/screens/settings.dart';

class DialerPage extends StatefulWidget {
  const DialerPage({super.key});

  @override
  State<DialerPage> createState() => _DialerPageState();
}

class _DialerPageState extends State<DialerPage> {
  String _dialedNumber = '';

  void _addDigit(String digit) {
    setState(() {
      _dialedNumber += digit;
    });
  }

  void _clearNumber() {
    setState(() {
      _dialedNumber = '';
    });
  }

  void _deleteLastDigit() {
    if (_dialedNumber.isNotEmpty) {
      setState(() {
        _dialedNumber = _dialedNumber.substring(0, _dialedNumber.length - 1);
      });
    }
  }

  void _makeCall() {
    if (_dialedNumber.isNotEmpty) {
     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Calling $_dialedNumber...'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _callContact(String name, String number) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling $name at $number...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialer', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsPage()),
                      );
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.contacts),
                    onPressed: () {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening contacts...')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _dialedNumber.isEmpty ? 'Enter number' : _dialedNumber,
                        style: TextStyle(
                          fontSize: 32.0,
                          color: _dialedNumber.isEmpty ? Colors.grey[500] : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (_dialedNumber.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.backspace),
                        onPressed: _deleteLastDigit,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              children: [
                _buildDialerButton('1', ''),
                _buildDialerButton('2', 'ABC'),
                _buildDialerButton('3', 'DEF'),
                _buildDialerButton('4', 'GHI'),
                _buildDialerButton('5', 'JKL'),
                _buildDialerButton('6', 'MNO'),
                _buildDialerButton('7', 'PQRS'),
                _buildDialerButton('8', 'TUV'),
                _buildDialerButton('9', 'WXYZ'),
                _buildDialerButton('*', ''),
                _buildDialerButton('0', '+'),
                _buildDialerButton('#', ''),
              ],
            ),
            const SizedBox(height: 20.0),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white),
                    iconSize: 28.0,
                    onPressed: _clearNumber,
                  ),
                ),
                
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.call, color: Colors.white),
                    iconSize: 36.0,
                    onPressed: _makeCall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Suggested Contacts',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                final contacts = ['John Doe', 'Jane Smith', 'Alex Johnson'];
                final numbers = ['+1 555-1000', '+1 555-1001', '+1 555-1002'];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[100 * (index + 1)],
                    child: Text(contacts[index][0]),
                  ),
                  title: Text(contacts[index]),
                  subtitle: Text('Mobile • ${numbers[index]}'),
                  trailing: const Icon(Icons.call, color: Colors.blue),
                  onTap: () => _callContact(contacts[index], numbers[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialerButton(String number, String letters) {
    return InkWell(
      onTap: () => _addDigit(number),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            if (letters.isNotEmpty)
              Text(
                letters,
                style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
              ),
          ],
        ),
      ),
    );
  }
}