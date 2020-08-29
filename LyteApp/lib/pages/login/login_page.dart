import 'package:LyteApp/assets/theme.dart';
import 'package:LyteApp/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  static String route = 'login-page';
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
          child: Column(
        children: [
          _buildLogoImage(),
          _buildInputfields(),
          _buildLoginButton(),
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

  Widget _buildLoginButton() {
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
            var loginResponse = await login(username, password);
            print(loginResponse);
          },
          child: Text('Sign in'),
        ),
      ),
    );
  }
}
