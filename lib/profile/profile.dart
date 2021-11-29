import 'package:flutter/material.dart';
import 'package:notification_push/flutter_microsoft_authentication.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  final value;
  const Profile({Key? key, this.value}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? userName = '';
  String? token = '';
  String? _authToken = 'Unknown Auth Token';
  FlutterMicrosoftAuthentication? fma;

  var res;

  Future<void> _signOut() async {
    String authToken;
    try {
      authToken = await fma!.signOut;
    } on PlatformException catch (e) {
      authToken = 'Failed to sign out.';
    }
    setState(() {
      _authToken = authToken;
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    userName = widget.value['userName'];
    token = widget.value['tokenValue'];
    res = widget.value['microsoftInfo'];
    _authToken = widget.value['tokenValue'];
    super.initState();
    fma = FlutterMicrosoftAuthentication(
        kClientID: "<client-id>",
        kAuthority: "https://login.microsoftonline.com/organizations",
        kScopes: ["User.Read", "User.ReadBasic.All"],
        androidConfigAssetPath: "assets/android_auth_config.json");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: _signOut,
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              userName!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email : ${res.email}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Given Name : ${res.givenName}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Surname : ${res.surname}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "DisplayName : ${res.displayName}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "UserName : $userName",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Mobile phone : ${res.mobilePhone}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Job title : ${res.jobTitle}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Favorite language : ${res.favoriteLanguage}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Office location : ${res.officeLocation}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "User id : ${res.id}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Token Value : $token",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}
