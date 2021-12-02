import 'package:flutter/material.dart';
import 'package:ronflex_flutter/models/user.dart';

class NullSafetyPage extends StatelessWidget {
  const NullSafetyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user;
    User? userBis = User(id: 'id', username: 'username', lastname: 'lastname');

    return Scaffold(
      appBar: AppBar(
        title: Text('Null Safety Page'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User null
            if (user != null) Text(user.username),
            Text(user?.username ?? 'username'),
            /***
             *    Text(user!.lastname!),
             *    would throw an error because user or lastname is null
             */
            // User not-null
            Text('*****************************'),
            Text(userBis.username),
            Text(userBis.firstname ?? 'firstname'),
            Text(userBis.lastname ?? 'lastname'),
            Text('*****************************'),
            Text(_transformString(user?.username)),
          ],
        ),
      ),
    );
  }

  String _transformString(String? str) {
    if (str != null) {
      return str;
    } else {
      return 'null';
    }
  }
}
