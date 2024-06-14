import 'package:flutter/material.dart';
import 'package:sqldemo/login.dart';
import 'package:sqldemo/sqlhelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>>? _userdata;

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate a delay
    final data = await SqlHelper.getItems();
    setState(() {
      _userdata = data;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: _userdata == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: const Text("Logout")),
                Expanded(
                  child: ListView.builder(
                    itemCount: _userdata!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_userdata![index]['userName']),
                        subtitle: Text(_userdata![index]['email']),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
