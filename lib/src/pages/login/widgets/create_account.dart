import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create New Account'),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: ListView(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ShowForm(
            //       label: 'Display Name :',
            //       iconData: Icons.fingerprint,
            //       changeFunc: (String string) {
            //         name = string.trim();
            //       },
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  onChanged: (String string) {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Display Name :',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 2.0,
                      blurRadius: 15.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ShowForm(
            //       textInputType: TextInputType.emailAddress,
            //       label: 'Email :',
            //       iconData: Icons.email_outlined,
            //       changeFunc: (String string) {
            //         email = string.trim();
            //       },
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String string) {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email :',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 2.0,
                      blurRadius: 15.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ShowForm(
            //       label: 'Password :',
            //       iconData: Icons.lock_clock_outlined,
            //       changeFunc: (String string) {
            //         password = string.trim();
            //       },
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (String string) {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password :',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 2.0,
                      blurRadius: 15.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ShowForm(
            //       maxLines: 4,
            //       textInputType: TextInputType.multiline,
            //       label: 'Address :',
            //       iconData: Icons.home,
            //       changeFunc: (String string) {
            //         address = string.trim();
            //       },
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  onChanged: (String string) {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Address :',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 2.0,
                      blurRadius: 15.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ShowForm(
            //       textInputType: TextInputType.phone,
            //       label: 'Phone :',
            //       iconData: Icons.phone_callback,
            //       changeFunc: (String string) {
            //         phone = string.trim();
            //       },
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onChanged: (String string) {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Phone :',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 2.0,
                      blurRadius: 15.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
