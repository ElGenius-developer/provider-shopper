import 'package:flutter/cupertino.dart';

// import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../calculatePrice.dart';

class ThirdScreen extends StatefulWidget {
  final product;
  final price;

  ThirdScreen({
    this.product,
    this.price,
  });
  @override
  _ThirdScreenState createState() =>
      _ThirdScreenState(price: this.price, product: this.product);
}

class _ThirdScreenState extends State<ThirdScreen> {
  final product;
  var price, removedObject;
  var counter=1;

  _ThirdScreenState({this.product, this.price});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // calc(firstIndex);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height / 10,
          title: Text(
            "Cart".toUpperCase(),
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 30,
                ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              setState(() {});
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
        backgroundColor: Color(0xffFFEB3B),
        body: Column(children: [
          Container(
            height: height / 1.6,
            padding: EdgeInsets.all(5),
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(15),
                itemCount: product.length,
                //(widget.product.length != null) ? widget.product.length : 2,
                itemBuilder: (context, index) {
                  return Container(
                    child: Dismissible(
                        resizeDuration: Duration(microseconds: 100),
                        key: Key(product[index]),
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          Calculation calculation =
                              Calculation(products: product);
                          setState(() {
                            price = calculation.subOfMap(product[index], price);
                            removedObject = widget.product[index];
                            product.remove(widget.product[index]);


                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                            duration: Duration(milliseconds: 500),
                              content: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text("${removedObject}is removed",
                              ),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    if(!widget.product.contains(removedObject)) {

                                      setState(() {
                                        widget.product.add(removedObject);
                                        price = calculation.sumOfMap(
                                            widget.product, price);
                                      });
                                    }
                                  },
                                  child: Text("UNDO",
                                    style: TextStyle(
                                        color: Colors.blue
                                    ),))
                            ],
                          )));
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(
                            CupertinoIcons.minus_circle,
                            color: Colors.red,
                          ),
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          width: width,
                          child: Text(
                            ".  ${product[index]}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  );
                }),
          ),
          Divider(
            color: Colors.black,
            thickness: 4,
          ),
          Container(
            width: width - 5,
            height: height / 4.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$ $price",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                CupertinoButton(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                    child: Text(
                      "buy".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {})
              ],
            ),
          )
        ]));
  }
}
