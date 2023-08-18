import 'package:flutter/material.dart';

class ProfileOnePage extends StatelessWidget {
  static const String path = "lib/pages/profile/profile1.dart";

  const ProfileOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("View Profile"),
          backgroundColor: Colors.red,
          elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              avatar: const AssetImage('assets/avatar/avatar0.jpg'),
              coverImage: const AssetImage('assets/image/image1.jpg'),
              title: "Ramesh Mana",
              subtitle: "Manager",
              actions: <Widget>[
                CircleAvatar(
                  minRadius: 30.0,
                  backgroundColor: Colors.red.shade600,
                  child: const Icon(Icons.call, size: 30.0),
                ),
                CircleAvatar(
                  minRadius: 30.0,
                  backgroundColor: Colors.red.shade600,
                  child: const Icon(Icons.message, size: 30.0),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.deepOrange.shade300,
                    child: const ListTile(
                      title: Text(
                        "50895",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      ),
                      subtitle: Text("FOLLOWERS",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: const ListTile(
                      title: Text(
                        "34524",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      ),
                      subtitle: Text(
                        "FOLLOWING",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                )
              ],
            ),
            UserInfo(),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ListTile.divideTiles(
          color: Colors.grey,
          tiles: [
            const ListTile(
              title: Text("Email",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 12.0)),
              subtitle: Text("ram@kumar.com", style: TextStyle(fontSize: 18.0)),
            ),
            const ListTile(
              title: Text("Phone",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 12.0)),
              subtitle:
                  Text("+977 9818225533", style: TextStyle(fontSize: 18.0)),
            ),
            const ListTile(
              title: Text("Twitter",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 12.0)),
              subtitle: Text("@ramkumar", style: TextStyle(fontSize: 18.0)),
            ),
            const ListTile(
              title: Text("Facebook",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 12.0)),
              subtitle: Text("facebook.com/ramkumar",
                  style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider avatar;
  final ImageProvider coverImage;
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  const ProfileHeader(
      {super.key,
      required this.avatar,
      required this.coverImage,
      required this.title,
      this.subtitle,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ink(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.5, 0.9],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red, Colors.deepOrange.shade300],
            ),
          ),
        ),
        if (actions != null) ...[
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 200,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: actions!,
            ),
          )
        ],
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.deepOrange.shade300,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar/avatar0.jpg'),
                    radius: 50,
                  ),
                ),
                const Text(
                  "Ram Kumar",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                Text(
                  "Kathmandu, Nepal",
                  style: TextStyle(fontSize: 14.0, color: Colors.red.shade700),
                )
              ],
            ))
      ],
    );
  }
}
