import 'package:provider_shopper/secondScreen/secondScreenComponent/dataForListViewCatalog.dart';

class Calculation {
  final products;

  Calculation({this.products});

  sumOfMap(List<String> list, int result ) {
    result=0;
    mapPrices.forEach((key, value) {
      list.forEach((element) {
        if (element == key) {
          result += value;
        }
      });
    });
    return result;
  }

  subOfMap(String pro, int result) {
    mapPrices.forEach((key, value) {
      if (pro == key) {
        result -= value;

      }
    });
    return result;
  }
}
