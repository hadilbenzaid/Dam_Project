import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    fetchProfilePicture();
  }

  Future<void> fetchProfilePicture() async {
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc('userId').get();
      setState(() {
        profileImageUrl = doc.data()?['profileImageUrl'] ?? '';
      });
    } catch (e) {
      print("Error fetching profile picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Row(
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.png', // Replace with your logo path
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Search Bar
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search, color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.orange[100],
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Profile Picture
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'profile');
              },
              child: CircleAvatar(
                radius: 20,
                backgroundImage: profileImageUrl != null && profileImageUrl!.isNotEmpty
                    ? NetworkImage(profileImageUrl!)
                    : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Explore Regions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.place, color: Colors.orange),
            title: const Text('Constantine', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pushNamed(context, '/constantine'); // Correct route name
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.place, color: Colors.orange),
            title: const Text('Batna', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pushNamed(context, '/batna'); // Correct route name
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
