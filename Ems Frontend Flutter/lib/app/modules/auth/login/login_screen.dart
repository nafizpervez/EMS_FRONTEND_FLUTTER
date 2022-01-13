import 'package:flutter/material.dart';

import 'local_widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            // SizedBox(
            //   width: 150.0,
            //   child: Image.asset(
            //     'assets/logos/adn/adn_tl_1.png',
            //   ),
            // ),
            // const SizedBox(
            //   height: 50.0,
            // ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
