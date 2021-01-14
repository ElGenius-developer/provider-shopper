import 'package:flutter/material.dart';

import '../../calculatePrice.dart';
import 'add_to_cart_icon.dart';
import 'dataForListViewCatalog.dart';

int totalPrice = 0;

class BuildListTile extends StatefulWidget {
  final index;
  final productList;
  final prices;

  BuildListTile({this.index, this.productList, this.prices});

  // BuildListTile({Key key, this.height, this.width, this.index,this.product, this.prices,  }) : super(key: key);

  @override
  _BuildListTileState createState() => _BuildListTileState();
}

class _BuildListTileState extends State<BuildListTile> {
  bool isSaved = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPrice = 0;
  }

  void addOrRemoveFromList(int index) {
    if (isSaved == true) {
      setState(() {
        widget.productList.remove(items[index]);
        Calculation calculation = Calculation(products: widget.productList);
        totalPrice = calculation.subOfMap(items[index], totalPrice);
      });
    } else {
      setState(() {
        widget.productList.add(items[index]);

        Calculation calculation = Calculation(products: widget.productList);
        totalPrice = calculation.sumOfMap(widget.productList, totalPrice);
      });
    }
  }

// int index =0;
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    isSaved = widget.productList.contains(items[widget.index]);

    // TODO: implement build
    return ListTile(
        leading: Container(
          width: width / 8,
          height: height * .06,
          child: ColoredBox(
            color: Color(colorsList[widget.index]),
          ),
        ),
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            '${items[widget.index]}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
        trailing: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: iconBuilder(isSaved),
          ),
          onTap: () {
            addOrRemoveFromList(widget.index);

           // print("${widget.productList}}");
          },
        ));
  }
}
