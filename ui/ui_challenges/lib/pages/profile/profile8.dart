import 'package:flutter/material.dart';

/// 基于stack实现带背景框的个人头像
/// 带有圆形边框的Avatar
class ProfileEightPage extends StatelessWidget {
  static const String path = "lib/pages/profile/profile8.dart";
  const ProfileEightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              avatar: const AssetImage('assets/avatar/avatar0.jpg'),
              coverImage: const AssetImage('assets/image/image1.jpg'),
              title: 'Ramesh Mana',
              subtitle: 'Manager',
              actions: [
                MaterialButton(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 0,
                  child: const Icon(Icons.edit),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 10.0),
            const UserInfo(),
            const UserInfo(),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: const Text(
              "User Information",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              // alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ...ListTile.divideTiles(
                    color: Colors.grey,
                    tiles: [
                      const ListTile(
                        leading: Icon(Icons.my_location),
                        title: Text("Location"),
                        subtitle: Text("Kathmandu"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text("sudeptech@gmail.com"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone"),
                        subtitle: Text("99--99876-56"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.person),
                        title: Text("About Me"),
                        subtitle: Text(
                            "This is a about me link and you can khow about me in this section."),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
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
      required this.title,
      required this.avatar,
      required this.coverImage,
      this.subtitle,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ink(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(image: coverImage, fit: BoxFit.cover)),
        ),
        Ink(
          height: 200,
          decoration: const BoxDecoration(color: Colors.black38),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
          ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider image;
  final Color borderColor;
  final Color? backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar(
      {Key? key,
      required this.image,
      this.borderColor = Colors.grey,
      this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        child:
            CircleAvatar(radius: radius - borderWidth, backgroundImage: image),
      ),
    );
  }
}
