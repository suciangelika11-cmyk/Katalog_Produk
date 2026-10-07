import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
          SizedBox(height: 16),
          Text(
            'Nama Anda',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('NIM Anda'),
        ],
      ),
    );
  }
}