import 'package:blog/future/service/user_service.dart';
import 'package:blog/future/view/login.dart';
import 'package:blog/product/companent/costum_textfield.dart';
import 'package:blog/product/const/icon_const.dart';
import 'package:blog/product/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
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
              AnimatedContainer(
                height: context.general.isKeyBoardOpen ? 0 : 150,
                width: context.general.isKeyBoardOpen ? 0 : 150,
                duration: Duration(seconds: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: IconsEnum.ic_logo.image),
                ),
              ),
              Text(
                "Register",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: MyTheme.black, fontWeight: FontWeight.w800),
              ),
              CostumTextfield(
                controller: _nameController,
                hintext: "name",
                iconData: Icons.person,
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
                      .register(_nameController.text, _emailController.text,
                          _passwordController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign Up",
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
            ],
          ),
        ),
      ),
    ));
  }
}
