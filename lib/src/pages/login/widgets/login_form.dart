// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/theme.dart' as custom_theme;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

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
        child: FormInput(),
      ),
    );
  }

  Container _buildSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _boxDecoration(),
        child: FlatButton(
          onPressed: () {},
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
  const FormInput({
    Key? key,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _color = Colors.black54;
  final usernameControlller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUsername(),
        Divider(
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
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Password :',
        labelStyle: _textStyle(),
        icon: FaIcon(
          FontAwesomeIcons.lock,
          size: 22.0,
          color: _color,
        ),
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
      controller: usernameControlller,
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
      ),
    );
  }
}
