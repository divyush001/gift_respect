import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {"user": "Alice", "message": "Hello! How are you?"},
    {"user": "Bob", "message": "Don't forget our meeting tomorrow."},
    {"user": "Charlie", "message": "Happy Birthday!"},
    {"user": "Diana", "message": "Can you send me the files?"},
    {"user": "Eve", "message": "Let's catch up soon!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Action for starting a new chat
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      messages[index]["user"]![0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    messages[index]["user"]!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    messages[index]["message"]!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(Icons.camera_alt_outlined),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for starting a new chat
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
