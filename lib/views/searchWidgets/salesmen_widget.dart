import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SalesmenWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container()
        // ListView.builder(
        //   itemCount: controller.salesmen.length,
        //   itemBuilder: (context, index) {
        //     return SalesmanCard(
        //       salesman: controller.salesmen[index],
        //       onTap: controller.navigateToTargetStatus,
        //       backgroundColor: Colors.white, // or any other color you want
        //     );
        //   },
        // ),
        );
  }
}
