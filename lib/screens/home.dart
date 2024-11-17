import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

import 'package:ladder_rush/screens/ladder_game.dart';

void main() => runApp(const LadderRushApp());

class LadderRushApp extends StatelessWidget {
  const LadderRushApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlayerInputScreen(),
    );
  }
}

class PlayerInputScreen extends StatefulWidget {
  const PlayerInputScreen({super.key});

  @override
  State<PlayerInputScreen> createState() => _PlayerInputScreenState();
}

class _PlayerInputScreenState extends State<PlayerInputScreen> {
  final List<Map<String, dynamic>> players = [];
  final TextEditingController nameController = TextEditingController();
  File? selectedImage; // 선택한 이미지를 저장할 변수
  final ImagePicker _picker = ImagePicker(); // ImagePicker 인스턴스 생성

  // 갤러리에서 이미지 선택
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path); // 선택된 이미지를 File로 저장
      });
    }
  }

  void _addPlayer() {
    if (nameController.text.isNotEmpty && selectedImage != null) {
      setState(() {
        players.add({
          'name': nameController.text,
          'image': FileImage(selectedImage!), // Save as ImageProvider
        });
        nameController.clear();
        selectedImage = null; // Reset after adding
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ladder Game - Input Players")),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Enter Player Name"),
          ),
          ElevatedButton(
            onPressed: _pickImage, // 갤러리에서 이미지 선택
            child: const Text("Select Player Image"),
          ),
          if (selectedImage != null) // 이미지가 선택되었을 때 미리보기
            Image.file(
              selectedImage!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ElevatedButton(
            onPressed: _addPlayer,
            child: const Text("Add Player"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: player['image'], // 저장된 Image 표시
                  ),
                  title: Text(player['name']),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (players.length >= 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LadderGameScreen(players: players),
                  ),
                );
              }
            },
            child: const Text("Start Ladder Game"),
          ),
        ],
      ),
    );
  }
}
