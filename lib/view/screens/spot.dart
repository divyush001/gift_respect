import 'package:flutter/material.dart';
import 'package:gift_respect/model/users.dart';
import 'package:gift_respect/view/widgets/spot_user_widget.dart';

class Spot extends StatelessWidget {
  const Spot({super.key, required this.users});
  final Future<List<Users>> users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Friends!'),
          SingleChildScrollView(
            child: SizedBox(
              height: 400,
              child: FutureBuilder<List<Users>?>(
                future: users,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading users'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No users found'));
                  }

                  final List<Users> users = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SpotUserWidget(
                        name: users[index].name,
                        isBleeding: users[index].isBleeding,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
