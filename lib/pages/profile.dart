import 'package:flutter/material.dart';
import '../services/profileService.dart';
import '../widgets/appDrawer.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      drawer: AppDrawer(context),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _ProfileBody(ProfileService()),
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  final ProfileService service;
  _ProfileInfo(this.service);
  @override
  Widget build(BuildContext context) {
    ProfileInfo userInfo = service.getProfileInfo();
    return Row(
      children: <Widget>[
        Flexible(flex: 1, child: Image.asset(userInfo.Photo)),
        Flexible(
          flex: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${userInfo.Name} ${userInfo.Surname}",
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  "Group : ${userInfo.Group}",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Faculty : ${userInfo.Faculty}",
                  style: TextStyle(fontSize: 18),
                )
              ]
                  .map(
                    (e) => Padding(
                      child: e,
                      padding: EdgeInsets.only(bottom: 5),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}

class _ProfileBody extends StatelessWidget {
  final ProfileService service;
  _ProfileBody(this.service);
  @override
  Widget build(BuildContext context) {
    ProfileInfo userInfo = service.getProfileInfo();
    return ListView(
      children: <Widget>[
        _ProfileInfo(service),
        _ProfileCard(
          title: Text("Can be found at : ", style: TextStyle(fontSize: 15)),
          content: Text(
            "Lecture hall 439",
            style: TextStyle(fontSize: 25),
          ),
        ),
        _ProfileCard(
          title: Text("Latest achievments : ", style: TextStyle(fontSize: 15)),
          content: Text(
            "User has no achievments yet",
            style: TextStyle(fontSize: 25),
          ),
        ),
        _ProfileCard(
          title:
              Text("Write ${userInfo.Name} a message : ", style: TextStyle(fontSize: 15)),
          content: Row(
            children: <Widget>[
              // TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Message',
              //   ),
              // ),
              RaisedButton(
                child: Text("Send"),
                onPressed: () => {},
              )
            ],
          ),
        ),
      ]
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(top: 5),
              child: e,
            ),
          )
          .toList(),
    );
  }
}

class _ProfileCard extends Card {
  _ProfileCard({Text title, Widget content})
      : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(padding: EdgeInsets.only(bottom: 5), child: title)
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [content])
              ],
            ),
          ),
        );
}
