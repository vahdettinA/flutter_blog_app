import 'package:blog/future/service/user_service.dart';
import 'package:blog/future/view/mybottomappbar.dart';
import 'package:blog/future/view/register.dart';
import 'package:blog/product/companent/costum_textfield.dart';
import 'package:blog/product/const/icon_const.dart';
import 'package:blog/product/theme/mytheme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  UserService _service = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MyTheme.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(IconsEnum.ic_logo.topath),
                  ),
                ),
                Text(
                  "LOGİN",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.black, fontWeight: FontWeight.w800),
                ),
                CostumTextfield(
                  controller: _emailController,
                  hintext: "email",
                  iconData: Icons.email,
                ),
                CostumTextfield(
                  controller: _passwordController,
                  hintext: "password",
                  iconData: Icons.lock,
                ),
                InkWell(
                  onTap: () {
                    _service
                        .login(_emailController.text, _passwordController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBottomTabbar()));
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: MyTheme.white, fontWeight: FontWeight.w700),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [MyTheme.gradient1, MyTheme.gradient2])),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: MyTheme.black, fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
