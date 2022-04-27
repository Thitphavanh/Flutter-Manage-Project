// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_project_manage/src/config/theme.dart' as custom_theme;
import 'package:flutter_project_manage/src/utils/RegexValidator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController? usernameControlller;
  TextEditingController? passwordControlller;

  String? _errorUsername;
  String? _errorPassword;

  @override
  void initState() {
    usernameControlller = TextEditingController();
    passwordControlller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameControlller!.dispose();
    passwordControlller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildForm(),
        _buildSubmitFormButton(),
      ],
    );
  }

  Card _buildForm() {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 18,
        left: 18,
        right: 18,
      ),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 60,
          right: 18,
          left: 18,
        ),
        child: FormInput(
          usernameControlller: usernameControlller,
          passwordControlller: passwordControlller,
          errorUsername: _errorUsername,
          errorPassword: _errorPassword,
        ),
      ),
    );
  }

  Container _buildSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _boxDecoration(),
        child: FlatButton(
          onPressed: () {
            String username = usernameControlller!.text;
            String password = passwordControlller!.text;

            _errorUsername = null;
            _errorPassword = null;

            if (!EmailSubmitRegexValidator().isValid(username)) {
              _errorUsername = 'The Email must be a valid email.';
            }
            if (password.length < 8) {
              _errorPassword = 'Must be at least 8 characters';
            }
            if (_errorUsername == null && _errorPassword == null) {
              if (username == 'hery@gmail.com' && password == '12345678') {

                
              }
            } else {
              setState(() {});
            }

            print(usernameControlller!.text);
            print(passwordControlller!.text);
          },
          child: const Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );

  BoxDecoration _boxDecoration() {
    final gradientStart = custom_theme.Theme.gradientStart;
    final gradientEnd = custom_theme.Theme.gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      boxShadow: [
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: LinearGradient(
        colors: [
          gradientEnd,
          gradientStart,
        ],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
        // begin: Alignment.topCenter,
        // end: Alignment.bottomCenter,
        // stops: [0.0, 1.0],
      ),
    );
  }
}

class FormInput extends StatefulWidget {
  final TextEditingController? usernameControlller;
  final TextEditingController? passwordControlller;
  final String? errorUsername;
  final String? errorPassword;

  const FormInput({
    Key? key,
    @required this.usernameControlller,
    @required this.passwordControlller,
    @required this.errorUsername,
    @required this.errorPassword,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _color = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUsername(),
        const Divider(
          height: 22,
          thickness: 1,
          indent: 13,
          endIndent: 13,
        ),
        _buildPassword(),
      ],
    );
  }

  TextFormField _buildPassword() {
    return TextFormField(
      controller: widget.passwordControlller,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Password :',
        labelStyle: _textStyle(),
        icon: FaIcon(
          FontAwesomeIcons.lock,
          size: 22.0,
          color: _color,
        ),
        errorText: widget.errorPassword,
      ),
      obscureText: true,
    );
  }

  TextStyle _textStyle() => TextStyle(
        fontWeight: FontWeight.w500,
        color: _color,
      );

  TextFormField _buildUsername() {
    return TextFormField(
      controller: widget.usernameControlller,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Email Address :',
        labelStyle: _textStyle(),
        hintText: 'xxxx@gmail.com',
        icon: FaIcon(
          FontAwesomeIcons.envelope,
          size: 22.0,
          color: _color,
        ),
        errorText: widget.errorUsername,
      ),
    );
  }
}
