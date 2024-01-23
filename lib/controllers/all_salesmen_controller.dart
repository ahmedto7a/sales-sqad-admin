import 'package:get/get.dart';

import '../models/salesmen.dart';
import '../views/target_status_screen.dart';

class AllSalesmenController extends GetxController {
  RxList<Salesman> salesmen;
  var filteredSalesmen = <Salesman>[].obs;

  AllSalesmenController(this.salesmen);

  @override
  void onInit() {
    super.onInit();
    updateFilteredSalesmen('');
  }

  void updateFilteredSalesmen(String query) {
    if (query.isEmpty) {
      filteredSalesmen.value = salesmen;
    } else {
      filteredSalesmen.value = salesmen
          .where((salesman) =>
              salesman.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  List<Salesman> getTopSalesmen(int count) {
    List<Salesman> sortedSalesmen = List.from(salesmen);
    sortedSalesmen.sort((a, b) => b.current
        .compareTo(a.current));
    return sortedSalesmen.take(count).toList();
  }

  void navigateToTargetStatus() {
    Get.to(() => TargetStatus(salesmen: salesmen.first,));
  }

  void goBack() {
    Get.back();
  }
}
