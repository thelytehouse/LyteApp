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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: _buildLogoImage(),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  _buildInputfields(),
                ],
              ),
            ),
          ),
          _buildLoginButton(context),
        ],
      ),
    );
  }

  Widget _buildLogoImage() {
    double _lrbPadding = 50.0;
    double _topPadding = 50.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(_lrbPadding, _topPadding, _lrbPadding, 0),
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LytehouseColors.purple,
              width: 1.5,
            ),
          ),
          hintText: 'Enter user name here',
        ),
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
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: LytehouseColors.purple,
              width: 1.5,
            ),
          ),
          hintText: 'Enter password here',
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
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
