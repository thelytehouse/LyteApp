import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/pages/home/home_page.dart';
import 'package:LyteApp/services/login_service.dart';
import 'package:LyteApp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  static String route = '/';
  static String _logoImagePath = 'lib/assets/images/full_logo.png';
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login Screen"),
      // ),
      body: Center(
          child: ListView(
        children: [
          _buildLogoImage(),
          _buildInputfields(),
          _buildLoginButton(context),
        ],
      )),
    );
  }

  Widget _buildLogoImage() {
    double _lrbPadding = 20.0;
    double _topPadding = 50.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          _lrbPadding, _topPadding, _lrbPadding, _lrbPadding),
      child: Image(
        image: AssetImage(_logoImagePath),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildInputfields() {
    return Column(
      children: [
        _buildUsernameInput(),
        _buildPasswordInput(),
      ],
    );
  }

  Widget _buildUsernameInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _usernameController,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Enter user name here'),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: true,
        controller: _passwordController,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Enter password here'),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
          color: LytehouseColors.purple,
          textColor: Colors.white,
          onPressed: () async {
            String username = _usernameController.text;
            String password = _passwordController.text;
            var loginResponse = await LoginService().login(username, password);
            if (loginResponse.status.toLowerCase() == 'success') {
              // Navigate to bens page
              print(loginResponse.status);
              print(loginResponse.message);
              var getUserDetails =
                  await UserService().getUserDetails(loginResponse.authToken);
              if (getUserDetails.status.toLowerCase() == 'success') {
                UserService().setUserToken(loginResponse.authToken);
                Navigator.pushReplacementNamed(context, HomePage.route);
              } else {
                print("failed to get the user details");
              }
            } else {
              // Give user error message
              print(loginResponse.status);
              print(loginResponse.message);
            }
          },
          child: Text('Sign in'),
        ),
      ),
    );
  }
}
