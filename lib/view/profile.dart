import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/viewmodel/generalprovider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    GeneralProivider generalProvider = Provider.of<GeneralProivider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("profile page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  generalProvider.incrementItem("profile");
                },
                child: const Text("add + 1")),
            Text(
              generalProvider.itemCountProfile.toString(),
              style: const TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
