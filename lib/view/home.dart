import 'package:flutter/material.dart';
import 'package:provider_test/universal_widget/mytext.dart';
import 'package:provider_test/utils/colors.dart';
import 'package:provider_test/utils/routes/routes_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: blue,
            title: const MyText(
              text: "Home Screen",
              color: white0,
              fontsize: 22,
              fontweight: FontWeight.w600,
            )),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.product);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).appBarTheme.backgroundColor),
                  child: const MyText(
                    text: "Activity List",
                    color: white0,
                    fontsize: 14,
                    fontweight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
