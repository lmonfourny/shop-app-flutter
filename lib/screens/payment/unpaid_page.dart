import 'package:eShop/app_properties.dart';

//import 'package:eShop/screens/payment/promo_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart_screen_provider.dart';

class UnpaidPage extends StatefulWidget {
  @override
  _UnpaidPageState createState() => _UnpaidPageState();
}

class _UnpaidPageState extends State<UnpaidPage> {
  Color active;

  @override
  Widget build(BuildContext context) {
    final CartscreenProvider cartscreenProvider =
        Provider.of<CartscreenProvider>(context);

    Widget payNow = InkWell(
//      onTap: () => Navigator.of(context)
//          .push(MaterialPageRoute(builder: (_) => ViewProductPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Pay Now",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Material(
        color: Colors.white,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (_, constraints) => SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Unpaid',
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CloseButton()
                        ],
                      ),
                    ),
                    //PromoItem(),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: shadow,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (_, index) => ListTile(
                              title:
                                  Text(cartscreenProvider.products[index].name),
                              trailing: Text(cartscreenProvider
                                      .products[index].price
                                      .toString() +
                                  " €"),
                            ),
                            itemCount: cartscreenProvider.products.length,
                          ),
                          ListTile(
                            title: Text('Tax'),
                            trailing: Text('1.25 €'),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            trailing: Text(
                              (cartscreenProvider.getUnpayed() + 1.25)
                                      .toString() +
                                  " €",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}
