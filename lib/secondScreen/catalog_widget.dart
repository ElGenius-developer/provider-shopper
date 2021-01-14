import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
 import 'package:provider_shopper/secondScreen/secondScreenComponent/buildListTileFunction.dart';
import 'package:provider_shopper/thirdScreen/cartWidget.dart';
import 'secondScreenComponent/dataForListViewCatalog.dart';



class CatalogWidget extends StatefulWidget {

  List<String>  products=[];


  @override
  _CatalogWidgetState createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {



Future pushNavigator () async {


   await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ThirdScreen(product:widget.products,price: totalPrice, ),
      ));
    setState(() {
     });
}


  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFEB3B ),
        centerTitle: true,
        elevation: 0,
        title: Text("Catalog",
        style: TextStyle(
          fontSize:(width)/11 ,
          color: Colors.black,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic


        ),),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.cart_fill,
              color: Colors.black,
                  size: height/25,), onPressed: (){

             pushNavigator();
          })
        ],
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView.builder(

          itemCount: items.length,
            scrollDirection: Axis.vertical,
             padding: EdgeInsets.symmetric(vertical: 10),

            itemBuilder: (context, index) {

              return  BuildListTile(index: index,
                prices: 0,
                productList: widget.products,
                   );// product: product,
            }
            ),
      ),
    );
  }

}
