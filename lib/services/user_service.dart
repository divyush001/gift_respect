import 'package:gift_respect/model/users.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class UserService {
  // Loads users from a local JSON asset and returns a list of User objects
  Future<List<Users>> loadUsers() async {
    final String response = await rootBundle.loadString(
      'assets/test/users.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Users.fromJson(json)).toList();
  }
}
