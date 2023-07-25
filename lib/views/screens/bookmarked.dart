import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper2/controller/apicontroller.dart';

class Bookmarked extends StatelessWidget {
  const Bookmarked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMarked Cities"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ApiController>(
          builder: (context, pro, _) {
            pro.getlists;
            if (pro.getlists.isEmpty) {
              return const Center(
                child: Text("You Have not Bookmarked"),
              );
            } else {
              return ListView.builder(
                itemCount: (pro.getlists!.isEmpty) ? 0 : pro.getlists?.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text("${pro.getlists![index]}"),
                  leading: Text("${index + 1}"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
