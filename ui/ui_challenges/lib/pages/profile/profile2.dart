import 'package:flutter/material.dart';

class ProfileTwoPage extends StatelessWidget {
  static const String path = "lib/pages/profile/profile2.dart";

  const ProfileTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.indigo.shade300,
                  Colors.indigo.shade500
                ])),
              ),
              const ProfileCard(),
            ],
          ),
          const SlideSection(),
          ...buildListView(context),
        ],
      ),
    );
  }

  List<Widget> buildListView(context) {
    return [
      Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
          child: Text("Most liked posts",
              style: Theme.of(context).textTheme.titleLarge)),
      for (int i = 0; i < 5; i++)
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset('assets/placeholder.jpg', fit: BoxFit.cover),
          ),
        )
    ];
  }
}

class SlideSection extends StatelessWidget {
  const SlideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Collection', style: Theme.of(context).textTheme.titleLarge),
              TextButton(
                  onPressed: () {},
                  child: const Text('Create new',
                      style: TextStyle(color: Colors.blue))),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                width: 150.0,
                height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset('assets/placeholder.jpg'),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'title',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.merge(TextStyle(color: Colors.grey.shade600)),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
              child: Material(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: <Widget>[
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text("Mebina Nepal",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 5.0),
                    const Text("UI/UX designer | Foodie | Kathmandu"),
                    const SizedBox(height: 16.0),
                    Row(children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            "302",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Posts".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12.0)),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            "10.3K",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Followers".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12.0)),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text(
                            "120",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("Following".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12.0)),
                        ),
                      ),
                    ])
                  ]))),
          Container(
              alignment: Alignment.center,
              child: const CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/avatar/avatar0.jpg'),
              ))
        ],
      ),
    );
  }
}
