import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: const Icon(Icons.arrow_back),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Text('72 x 72'),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Michel Reckliff',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    _buildUserMessage('Hi, good afternoon Michel', false),
                    _buildUserMessage('Hello Good Afternoon Dr.', true),
                    _buildUserMessage(
                        'I’ve been experiencing some discomfort in my lower abdomen',
                        true),
                    _buildUserMessage(
                        'Have you noticed any other symptoms, such as fever or changes in urination?',
                        false),
                    _buildUserMessage(
                        'No fever, but I’ve been urinating more frequently than usual.',
                        true),
                  ],
                ),
              ),
              _buildMessageInput(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserMessage(String message, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blueAccent),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
