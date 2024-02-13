import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pwdController = TextEditingController();
  String myPass = '';

  final storage = const FlutterSecureStorage();
  final mYkey = 'myPass';

  Future writeToSecureStorage() async {
    await storage.write(key: mYkey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: mYkey) ?? "";
    return secret;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
        
            children: [
              TextField(
                controller: pwdController,
              ),
              // ElevatedButton(child: const Text('Save Value'), onPressed: () {}),
              // ElevatedButton(child: const Text('Read Value'), onPressed: () {}),
              ElevatedButton(
                  child: const Text('Save Value'),
                  onPressed: () {
                    writeToSecureStorage();
                  }),
              ElevatedButton(
                  child: const Text('Read Value'),
                  onPressed: () {
                    readFromSecureStorage().then((value) {
                      setState(() {
                        myPass = value;
                      });
                    });
                  }),
              Text(myPass),
            ],
          ),
        ),
      ),
    );
  }
}
