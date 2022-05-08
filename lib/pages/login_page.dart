import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      await context.vxNav.push(Uri.parse(MyRoutes.homeRoute));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome $name',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter username', labelText: 'UserName'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username cannot be empty';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Enter password', labelText: 'Password'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 6) {
                            return 'Password length must be atleast 6';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        color: context.theme.buttonColor,
                        child: InkWell(
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: changeButton ? 50 : 150,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            // When there is an Ancestor, child shouldn't have its decoration as it may override ancestors decoration
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     // shape: changeButton
                            //     //     ? BoxShape.circle
                            //     //     : BoxShape.rectangle,
                            //     borderRadius:
                            //         BorderRadius.circular(changeButton ? 50 : 8)),
                          ),
                          onTap: () => moveToHome(context),
                        ),
                      )
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: Text('Login'),
                      //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
