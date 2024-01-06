import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Infocard extends StatelessWidget {
  const Infocard({
    Key?key, required this.name, required this.tagline,
  }): super(key: key);

  final String name, tagline;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white70,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white70),
      ),
      subtitle: Text(
      tagline,
      style: TextStyle(color: Colors.white70)),
    );
  }
}
