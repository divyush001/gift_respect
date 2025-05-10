// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SpotUserWidget extends StatelessWidget {
  SpotUserWidget({super.key, required this.name, required this.isBleeding});

  String name;
  bool isBleeding;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return SizedBox(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 20, letterSpacing: 3),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person_remove),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        side: BorderSide(color: colorScheme.primary, width: 5),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Gift Her'),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: checkIfBleeding(isBleeding),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

checkIfBleeding(bool isBleeding) {
  return isBleeding
      ? const Icon(Icons.bloodtype, color: Colors.red)
      : const Icon(Icons.bloodtype, color: Colors.grey);
}
