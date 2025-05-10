import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HomeAdvanced extends StatelessWidget {
  final List<String> friends = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Friend Suggestions')),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(friends[index][0])),
            title: Text(friends[index]),
            subtitle: Text('Suggested friend'),
            trailing: ElevatedButton(
              onPressed: () async {
                final String friend = friends[index];
                final String filePath = 'assets/test/users.json';
                final String jsonString = await DefaultAssetBundle.of(
                  context,
                ).loadString(filePath);
                final List<dynamic> users =
                    jsonString.isNotEmpty
                        ? List.from(json.decode(jsonString))
                        : [];
                users.add({'name': friend, 'status': 'added'});
                final String updatedJsonString = json.encode(users);
                final file = File(filePath);
                await file.writeAsString(updatedJsonString);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$friend added to users.json')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Add'),
            ),
          );
        },
      ),
    );
  }
}
