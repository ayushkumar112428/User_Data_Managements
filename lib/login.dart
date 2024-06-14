import 'package:flutter/material.dart';
import 'package:sqldemo/component.dart';
import 'package:sqldemo/home.dart';
import 'package:sqldemo/signup.dart';
import 'package:sqldemo/sqlhelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Map<String, dynamic>>? userdata;

  Future<void> _loadData() async {
    final data = await SqlHelper.getItems();
    setState(() {
      userdata = data;
    });
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                for (int i = 0; i < userdata!.length; i++) {
                  if (userdata![i]['email'] == email.text &&
                      userdata![i]['password'] == password.text) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  }
                }
                print("Enter carect email and password......................");
              },
              child: const ButtionStyle(title: "Login"),
            ),
            const SizedBox(
              height: 7,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignupScreen()));
                },
                child: const Text("SignUp")),
          ],
        ),
      ),
    );
  }
}
