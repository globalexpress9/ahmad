// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:core';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../constant.dart';
import '../main.dart';
import '../screens/HomeWeb/Home.dart';
import '../screens/web/steps/stepFive.dart';
import 'PaypalServices.dart';

class PaypalPayment extends StatefulWidget {
  final Function onFinish;



  const PaypalPayment({Key? key, required this.onFinish}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  showSnakBar(String mss) {
  var snackBar = SnackBar(
    elevation: 0.0,
    padding: const EdgeInsetsDirectional.all(5),
    margin: const EdgeInsetsDirectional.all(5),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    duration: const Duration(seconds: 2),
    content: AwesomeSnackbarContent(
      title: 'Oop !',
      message: "      $mss",
      contentType: ContentType.failure,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


  _showDialog(String s, bool w) {
    ///////////////


    if (s !=
        "Ihre Bestellung wurde erfolgreich registriert\n Die Ware wird zu dem von Ihnen angegebenen Zeitpunkt versendet") {

    }

    else {
      showDialog(
        barrierDismissible: false, context: context, builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 10,
          scrollable: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.schedule_send_outlined),
              SizedBox(width: 10),
              Text("wurde gesendet", textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontFamily: "Lemonada"),)
            ],
          ),
          content: Text(s, textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontFamily: "Lemonada")),
          actions: [
            Visibility(
              visible: !w,
              child: MaterialButton(
                color: Colors.green,
                child: const Text("Gut",
                    style: TextStyle(fontSize: 14, fontFamily: "Lemonada")),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: ((context) =>  const HomePageWeb())), (
                          route) => false);
                },

              ),
            ),

          ],
        );
      },);
    }

    ///////////////
  }



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var checkoutUrl;
  var executeUrl;
  var accessToken;
  PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "EUR",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "EUR"
  };

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';



  addData()async{
    _showDialog("", true);
    var respons = await client.from("data").insert({
      "name": NAMEUSER,
      "email": EMAILUSER,
      "report": allReport,
      "totalprice": Data.totPrice,
      "time": DateTime.now().toString(),
    }).execute();

    if (respons.error != null) {
      Navigator.pop(context);
      showSnakBar("Die Internetverbindung ist sehr langsam");}


    Navigator.pop(context);
    _showDialog(
        "Ihre Bestellung wurde erfolgreich registriert\n Die Ware wird zu dem von Ihnen angegebenen Zeitpunkt versendet",
        false);

  }
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
            await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
          });
        }
      } catch (e) {
        print('exception: $e');
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
              Navigator.pop(context);
            },
          ),
        );
        // ignore: deprecated_member_use
        _scaffoldKey.currentState!.showSnackBar(snackBar);
      }
    });
  }

  // item name, price and quantity
  String itemName = 'Global Express';
  String itemPrice = '${Data.totPrice}';
  int quantity = 1;

  Map<String, dynamic> getOrderParams() {
    List items = [
      {
        "name": itemName,
        "quantity": quantity,
        "price": itemPrice,
        "currency": defaultCurrency["currency"]
      }
    ];

    // checkout invoice details
    String totalAmount = itemPrice;
    String subTotalAmount = itemPrice;
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    String userFirstName = 'Gulshan';
    String userLastName = 'Yadav';
    String addressCity = 'Delhi';
    String addressStreet = 'Mathura Road';
    String addressZipCode = '110014';
    String addressCountry = 'India';
    String addressState = 'Delhi';
    String addressPhoneNumber = '+919990119091';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping && isEnableAddress)
              "shipping_address": {
                "recipient_name": "$userFirstName $userLastName",
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: WebView(
          initialUrl: checkoutUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains(returnURL)) {
              final uri = Uri.parse(request.url);
              final payerID = uri.queryParameters['PayerID'];
              if (payerID != null) {
                services
                    .executePayment(executeUrl, payerID, accessToken)
                    .then((id) {
                  widget.onFinish(id);
                  print("Fincsh");
                  addData();
                 // Navigator.of(context).pop();
                });
              } else {
                Navigator.of(context).pop();
              }
              Navigator.of(context).pop();
            }
            if (request.url.contains(cancelURL)) {
              Navigator.of(context).pop();
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: const CircularProgressIndicator())),
      );
    }
  }
}
