// ignore_for_file: deprecated_member_use
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_project_manage/src/config/theme.dart' as custom_theme;
import 'package:flutter_project_manage/src/config/route.dart' as custom_route;
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
          onPressed: _onLogin,
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
    const gradientStart = custom_theme.Theme.gradientStart;
    const gradientEnd = custom_theme.Theme.gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: const Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
      boxShadow: [
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: const LinearGradient(
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

  void showAlertBar() {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      title: 'Username or Password is inccorrect',
      message: 'Please try again',
      backgroundColor: Colors.black,
      icon: const Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red,
      ),
      duration: const Duration(seconds: 3),
      boxShadows: const [
        BoxShadow(
          color: Colors.black,
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
    ).show(context);
  }

  void showLoading() {
    Flushbar(
      borderRadius: BorderRadius.circular(8),
      message: 'Loading...',
      showProgressIndicator: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    )..show(context);
  }

  void _onLogin() {
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
      showLoading();
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Navigator.pop(context);
        if (username == 'hery@gmail.com' && password == '12345678') {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(
          //       name: 'Hery',
          //       age: 27,
          //     ),
          //   ),
          // );
          Navigator.pushReplacementNamed(
            context,
            custom_route.Route.home,
            arguments: {
              'name': 'Hery',
              'age': 27,
            },
          );
        } else {
          showAlertBar();
          setState(() {});
        }
      });
    } else {
      setState(() {});
    }

    print(usernameControlller!.text);
    print(passwordControlller!.text);
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
  bool? _obscureTextPassword;
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _obscureTextPassword = true;
    super.initState();
  }

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
      focusNode: _passwordFocusNode,
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
        suffixIcon: IconButton(
          icon: FaIcon(
            _obscureTextPassword!
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
            color: _color,
            size: 15.0,
          ),
          onPressed: () {
            setState(
              () {
                _obscureTextPassword = !_obscureTextPassword!;
              },
            );
          },
        ),
      ),
      obscureText: _obscureTextPassword!,
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
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
    );
  }
}
