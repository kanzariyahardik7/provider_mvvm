import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/universal_widget/mynetworkimage.dart';
import 'package:provider_test/universal_widget/mytext.dart';
import 'package:provider_test/utils/colors.dart';
import 'package:provider_test/viewmodel/activity_view_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ActivityViewModel activityViewModel;
  @override
  void initState() {
    super.initState();
    activityViewModel = Provider.of<ActivityViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchActivityData();
    });
  }

  fetchActivityData() {
    activityViewModel.fetchActivityList();
  }

  deleteActivity(int id) {
    Map<String, dynamic> map = {"id": id};
    activityViewModel.deleteActivity(map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: white0),
          title: const MyText(
            text: "Product Screen",
            color: white0,
            fontsize: 22,
            fontweight: FontWeight.w600,
          )),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Consumer<ActivityViewModel>(
            builder: (context, acVM, child) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                shrinkWrap: true,
                itemCount: acVM.activityList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var data = acVM.activityList[index];
                  return Stack(
                    children: [
                      Container(
                        color: blue,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyNetworkImage(
                              imageUrl: data.media?.isEmpty == true
                                  ? ""
                                  : data.media?.first.fullUrl,
                              fit: BoxFit.cover,
                              imgHeight: 150,
                              imgWidth: MediaQuery.sizeOf(context).width,
                            ),
                            MyText(
                              text: data.title ?? "",
                              color: white0,
                              fontsize: 14,
                              fontweight: FontWeight.w600,
                            ),
                            MyText(
                              text: data.description ?? "",
                              color: white0,
                              fontsize: 12,
                              fontweight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: IconButton(
                            onPressed: () {
                              deleteActivity(data.id ?? 0);
                              acVM.activityList.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: white0,
                              size: 30,
                            )),
                      )
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
