import 'package:flutter/material.dart';
import 'package:sqldemo/component.dart';
import 'package:sqldemo/home.dart';
import 'package:sqldemo/login.dart';
import 'package:sqldemo/sqlhelper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Map<String, dynamic> data = {
    'userName': "",
    'email': "",
    'password': "",
  };
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "SignUp",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextFromFildes(controller: username, hintText: "Enter userName"),
              const SizedBox(
                height: 7,
              ),
              TextFromFildes(controller: email, hintText: "Enter Email"),
              const SizedBox(
                height: 7,
              ),
              TextFromFildes(controller: password, hintText: "Enter Password"),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      data['userName'] = username.text;
                      data['email'] = email.text;
                      data['password'] = password.text;
                      _addItem();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }
                  },
                  child: const ButtionStyle(title: "SignUp")),
              const SizedBox(
                height: 7,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: const Text("Logine"))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addItem() async {
    final int id = await SqlHelper.createItem(data);
    debugPrint("User id: $id");
  }
}
