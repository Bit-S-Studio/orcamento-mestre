import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class CustomHasuraConnect {
  static HasuraConnect getConnect(FirebaseAuth auth) {
    return HasuraConnect('https://orcamentomestre.herokuapp.com/v1/graphql',
        token: (_) async {
      var user = await auth.currentUser();

      var token = await user.getIdToken(refresh: true);

      if (token != null) {
        print(token);
        return "Bearer ${token.token}";
      } else {}
    });
  }
}
