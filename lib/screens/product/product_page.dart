import 'package:eShop/app_properties.dart';
import 'package:eShop/cart_screen_provider.dart';
import 'package:eShop/models/product.dart';
import 'package:eShop/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/product_display.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  ProductPage({Key key, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(product);
}

class _ProductPageState extends State<ProductPage> {
  final Product product;
  final ageController = TextEditingController();

  _ProductPageState(this.product);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    final CartscreenProvider cartscreenProvider =
        Provider.of<CartscreenProvider>(context);

    Widget viewProductButton = InkWell(
      onTap: () {
        cartscreenProvider.products.add(product);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CheckOutPage()));
      },
      child: Container(
        height: 80,
        width: width / 1.5,
        decoration: BoxDecoration(
          gradient: mainButton,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ],
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Center(
          child: Text("Add to cart",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                ProductDisplay(
                  product: product,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        color: const Color(0xFFFEFEFE),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print("clicked");
                        },
                        child: Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(253, 192, 84, 1),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                                color: Color(0xFFFFFFFF), width: 0.5),
                          ),
                          child: Center(
                            child: new Text("Details",
                                style: const TextStyle(
                                    color: const Color(0xeefefefe),
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 40.0, bottom: 130),
                    child: new Text(product.description,
                        style: const TextStyle(
                            color: const Color(0xfefefefe),
                            fontWeight: FontWeight.w800,
                            fontFamily: "NunitoSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0)))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                  top: 8.0, bottom: bottomPadding != 20 ? 20 : bottomPadding),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(253, 192, 84, 0.5),
                    Color.fromRGBO(253, 192, 84, 1),
                  ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter)),
              width: width,
              height: 120,
              child: Center(child: viewProductButton),
            ),
          ),
        ],
      ),
    );
  }
}
