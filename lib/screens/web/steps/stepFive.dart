




// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


import '../../../constant.dart';
import '../../../main.dart';
import '../../../paypal/PaypalPayment.dart';
import '../../HomeWeb/Home.dart';
import '../../HomeWeb/Services/PlatformServices.dart';

class StepFive extends StatefulWidget {
  const StepFive({Key? key}) : super(key: key);

  @override
  State<StepFive> createState() => _StepFiveState();
}

// All report
String allReport = "";
String endEmail = " Inkl. 60 Minuten für Beladen,\nEntladen und sonstige Wartezeit,\nje weitere angefangene Stunde 30 EUR netto.\nFahrzeug ohne Hebebühne/Ladebordwand (sofern nicht anders angegeben).\nFahrer ist allein, ggf. benötigt er Hilfe beim Be- und Entladen.\nWenn eine Versandeinheit mehr als 30kg wiegt,\ndann benötigt der Fahrer Hilfe beim Be- und Entladen.\nBeladung ist seitlich und von hinten möglich.\nFahrzeug hat keine Rampenhöhe. Kein Palettentausch.\nKeine Inselbelieferung.\nRechnungsversand erfolgt per E-Mail (sofern nicht anders angegeben) nach dem Transport.\nAblieferbelege nur elektronisch und nur auf Anfrage.\nVersichert mit bis zu 40 SZR/kg Rohgewicht.";



class _StepFiveState extends State<StepFive> {

  final serviceId = 'service_07frpae';
  final templateId = 'template_6oubd9u';
  final userId = '4D4Q2WnPbe7xTUcQb';
  String endId = "";

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
      showDialog(
        barrierDismissible: false, context: context, builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,

          elevation: 10,
          scrollable: false,
          title: w ? const Center(child: CircularProgressIndicator(
              color: Colors.green, strokeWidth: 3),) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.error),
              SizedBox(width: 10),
              Text(
                "Notiz",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontFamily: "Lemonada"),
              ),
            ],
          ),
          content: w ? const Text("Angemeldet", textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontFamily: "Lemonada"),)
              : Text(s, textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontFamily: "Lemonada"),),
          actions: [
            Visibility(
              visible: !w,
              child: MaterialButton(
                color: Colors.green,
                child: const Text("Gut",
                    style: TextStyle(fontSize: 14, fontFamily: "Lemonada")),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        );
      },);
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
                      MaterialPageRoute(builder: ((context) =>  HomePageWeb())), (
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

  /// step 1
  String typeCar = "";
  String needHelpCar1 = "";
  String needHelpCar2 = "";
  /// step 2
  String infoPackstuck2 = "";
  /// step 3
  String infoStepThird3 = "";
  /// step 4
  String infoStepFour4 = "";

  caliReport() {

    /// step 1
    if (Data.selectRadioButton[0] == 1) {
      typeCar = "1600 x 120 x 120 cm (Max 400kg) ";
    } else if (Data.selectRadioButton[1] == 1) {
      typeCar = "320  x 130 x 160 cm (Max 800kg) ";
    } else if (Data.selectRadioButton[2] == 1) {
      typeCar = "420  x 210 x 210 cm (Max 1200kg) ";
    } else {
      typeCar = "420  x 210 x 210 cm (Max 800kg) ";
    }

    if (Data.selectCheckbox[0] == true) {
      needHelpCar1 = "Ihr Held hilft beim Beladen des Autos";
    }
    if (Data.selectCheckbox[1] == true) {
      needHelpCar2 = "Ihr Held hilft beim Beladen des Autos";
    }

    /// step 2
    infoPackstuck2 =
    "\n\nPaket\nMenge   : ${Data.infoPackstuck[0]}\nGuter : ${Data.infoPackstuck[1]} \n"
        "Gewicht : ${Data.infoPackstuck[2]}\nLange: ${Data.infoPackstuck[3]}\n"
        "Breite  : ${Data.infoPackstuck[4]}\nHohe : ${Data.infoPackstuck[5]}\n\n";

    /// step 3
    infoStepThird3 =
    "Abholung eingeben \nFirma: ${Data.infoStepThird[0]}\nAnsprechpartner : ${Data.infoStepThird[1]}\n"
        "StraBe : ${ Data.infoStepThird[2]}\nPlz : ${Data.infoStepThird[3]}\n"
        "Stadt : ${Data.infoStepThird[5]}\nTelefon Nummer: ${Data.infoStepThird[6]}\n"
        "Lad-Referenz :  ${Data.infoStepThird[7]} \n\n";

    /// step 4
    infoStepFour4 =
    "Zustellung eingeben \nFirma: ${Data.infoStepFour[0]}\nAnsprechparthner : ${Data.infoStepFour[1]}\n"
        "StraBe + Hausnr : ${Data.infoStepFour[3]}\n"
        "Stadt : ${Data.infoStepFour[4]}\nPostleitzahl/Ort: ${Data.infoStepFour[5]}\n"
        "Telefon Nummer :  ${Data.infoStepFour[6]}\nLad-Referenz : ${Data.infoStepFour[7]}\n"
        "Zusätzliche Bemerkungen :${Data.infoStepFour[8]} \n\n";

    allReport =
    "$typeCar\n $needHelpCar1\n$needHelpCar2\n $infoPackstuck2 \n $infoStepThird3 \n $infoStepFour4 ";

    setState(() {});
  }
  sendEmail() async {


    try {
      final res = await http.post(
        Uri.parse("https://api.emailjs.com/api/v1.0/email/send"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': NAMEUSER,
            'user_email': EMAILUSER, // To
            'user_subject': 'Per Rechnung zahlen',
            'user_message': 'vielen Dank für die Beauftragung des Transports.\n'
                'Auftragsnummer ($endId) \n\n'
                '$typeCar \n'
                ' $needHelpCar1 \n '
                ' $needHelpCar2 \n'
                ' $infoPackstuck2 \n '
                ' $infoStepThird3 \n'
                ' $infoStepFour4 \n'
                'Gesamtzahlung : <<< ${Data.totPrice} EUR >>>\n\n\n'
                'adress'
                'name'
                'Tel : +49 176 627 997 32\n\n'
                'bankdaten\n'
                'Alaa Alsatouf\n'
                'De45370501981935407237\n'
                'Sparkasse Könbonn\n'
                'Colsde33xxx\n\n'
                'Mit Freundlichen Grüßen\n'
                'Global Express Team\n\n'
                '$endEmail',


          }
        }),

      );

      if (res.statusCode == 200) {
        print("okkkkkkk Sended Email");

        _showDialog(
            "Ihre Bestellung wurde erfolgreich registriert\n Die Ware wird zu dem von Ihnen angegebenen Zeitpunkt versendet",
            false);
      }
      else {
        Navigator.pop(context);
        print("Send Email Erorr StatusCade : ${res.body}  $res 4 ${res.request}");
        showSnakBar('Oop No Internet');
      }
    } catch (e) {
      Navigator.pop(context);
      print("Send Email Erorr : &e");
      showSnakBar('$e');
    }
  }
  addData() async {
    _showDialog("", true);

    // serach user
    var getEndId = await
    client
        .from("data")
        .select()
        .execute();

    if (getEndId.error != null) {
      Navigator.pop(context);
      showSnakBar("Die Internetverbindung ist sehr langsam");}


    List<dynamic> l = getEndId.data;


    if (l.isNotEmpty) {
      //  print("truee");
      endId = l[l.length - 1]['id'].toString();
      int a = int.parse(endId);
      a += 1;
      endId = a.toString();
    }

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

    sendEmail();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    caliReport();
  }


    @override
    Widget build(BuildContext context) {
      double width = MediaQuery
          .of(context)
          .size
          .width;
      double height = MediaQuery
          .of(context)
          .size
          .height;


      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.network("https://i.imgur.com/BCeNIds.jpeg", fit: BoxFit.fill),
            Center(
              child: Container(
                width: width * 0.9,
                height: height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),

                padding: EdgeInsetsDirectional.only(top: height * 0.06,
                    start: width * 0.1,
                    bottom: height * 0.06),
                child: SingleChildScrollView(
                  child: PlatFormServices.isMobile(context) ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // 1
                      Text(
                        "Das Auto", style: TextStyle(fontSize: 20, color: Colors
                          .red.shade900, fontFamily: "Lemonada"),),
                      Text.rich(
                          TextSpan(
                            children: [

                              TextSpan(
                                text: " $typeCar",
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Visibility(
                        visible: needHelpCar1 == "" ? false : true,
                        child: Text(needHelpCar1, style: const TextStyle(
                            fontSize: 12, fontFamily: "Lemonada"),),
                      ),
                      Visibility(
                        visible: needHelpCar2 == "" ? false : true,
                        child: Text(needHelpCar2, style: const TextStyle(
                            fontSize: 12, fontFamily: "Lemonada"),),
                      ),
                      const SizedBox(height: 10),


                      // 3
                      Text("AUFTRAGGEBER",
                        style: TextStyle(fontSize: 20, color: Colors.red
                            .shade900, fontFamily: "Lemonada"),),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Firma \n ",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepThird[0],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Ansprechpartner \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepThird[1],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "StraBe und Hausnummer \n",
                                style: TextStyle(fontSize: 17,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepThird[2],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Plz \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepThird[3],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),


                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Stadt\n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepThird[5],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Telefon Nummer \n ",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepThird[6],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Lad-Referenz \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepThird[7],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),

                            ],
                          )
                      ),
                      /////////// Must Add Date and Time
                      const Divider(color: Colors.black),
                      const SizedBox(height: 10),


                      // 2
                      Text("Paket", style: TextStyle(fontSize: 20, color: Colors
                          .red.shade900, fontFamily: "Lemonada"),),
                      Text.rich(
                          TextSpan(
                            children: [

                              TextSpan(
                                text: "Menge  \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: " ${Data.infoPackstuck[0]}",
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Guter \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: " ${Data.infoPackstuck[1]}",
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Gewicht \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: " ${Data.infoPackstuck[2]}",
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Lange\n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: " ${Data.infoPackstuck[3]}",
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Breite  \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: " ${Data.infoPackstuck[4]}",
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Hohe \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: " ${Data.infoPackstuck[5]}",
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 10),


                      // 4
                      Text("Zustellung eingeben",
                        style: TextStyle(fontSize: 20, color: Colors.red
                            .shade900, fontFamily: "Lemonada"),),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Firma :\n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[0],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Ansprechparthner \n ",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[1],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "StraBe + Hausnr \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[3],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Stadt \n ",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[4],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),

                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Postleitzahl/Ort \n ",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[5],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Telefon Nummer \n",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[6],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Lad-Referenz \n ",
                                style: TextStyle(fontSize: 20,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[7],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Zusätzliche Bemerkungen \n",
                                style: TextStyle(fontSize: 15,
                                    color: Colors.green.shade900,
                                    fontFamily: "Lemonada"),
                              ),
                              TextSpan(
                                text: Data.infoStepFour[8],
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: "Lemonada"),

                              ),
                            ],
                          )
                      ),
                      const Divider(color: Colors.black),

                      SizedBox(height: 20),
                      // الدفع
                      Text("Zahlungsarten",
                        style: TextStyle(fontSize: 20, color: Colors.red
                            .shade900, fontFamily: "Lemonada"),),
                      Text("Gesamtzahlung : ${Data.totPrice} EUR ",
                        style: TextStyle(fontSize: 15, color: Colors.blue
                            .shade900, fontFamily: "Lemonada"),),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsetsDirectional.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(0, 150, 50, 40),
                                Color.fromRGBO(0, 200, 60, 92),
                              ]),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            await addData();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          splashColor: const Color.fromRGBO(30, 30, 30, .51),
                          child: const Text(
                            'Per Rechnung zahlen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'Lemonada',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsetsDirectional.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(0, 150, 50, 40),
                                Color.fromRGBO(0, 200, 60, 92),
                              ]),),

                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => PaypalPayment(
                                  onFinish: (number) async {
                                    // payment done
                                    print('order id: ' + number);
                                  },
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.paypal, color: Colors.black),
                          label: const Text(
                            "Zahlen Sie über PayPal", style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontFamily: 'Lemonada',
                          ),),
                        ),
                      ),


                    ],
                  )

                      :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // 1
                              Text("Das Auto \n", style: TextStyle(fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontFamily: "Lemonada"),),

                              Text.rich(
                                  TextSpan(
                                    children: [

                                      TextSpan(
                                        text: typeCar,
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Visibility(
                                visible: needHelpCar1 == "" ? false : true,
                                child: Text(needHelpCar1,
                                  style: const TextStyle(
                                      fontSize: 15, fontFamily: "Lemonada"),),
                              ),
                              Visibility(
                                visible: needHelpCar2 == "" ? false : true,
                                child: Text(needHelpCar2,
                                  style: const TextStyle(
                                      fontSize: 15, fontFamily: "Lemonada"),),
                              ),
                              const SizedBox(height: 10),

                            ],
                          ),),
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // 2
                              Text("Paket", style: TextStyle(fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontFamily: "Lemonada"),),

                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Menge  :",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: " ${Data.infoPackstuck[0]}",
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Guter :",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: " ${Data.infoPackstuck[1]}",
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Gewicht :",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: " ${Data.infoPackstuck[2]}",
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Lange:",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: " ${Data.infoPackstuck[3]}",
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Breite  :",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: " ${Data.infoPackstuck[4]}",
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Hohe :",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: " ${Data.infoPackstuck[5]}",
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              const SizedBox(height: 10),

                            ],
                          ),

                          ),


                        ],
                      ),
                      const Divider(color: Colors.black, endIndent: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // 3
                              Text("AUFTRAGGEBER", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontFamily: "Lemonada"),),

                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Firma : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepThird[0],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Ansprechpartner : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepThird[1],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "StraBe und Hausnummer : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepThird[2],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Plz : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepThird[3],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),

                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Stadt: ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepThird[5],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Telefon Nummer : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepThird[6],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Lad-Referenz : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepThird[7],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Zusätzliche Bemerkungen : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[8],
                                        style: const TextStyle(fontSize: 13,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),

                              const SizedBox(height: 10),


                            ],
                          ),),
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 4
                              Text("Zustellung eingeben", style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontFamily: "Lemonada"),),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Firma : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[0],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Ansprechparthner : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[1],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),


                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "StraBe + Hausnr : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[3],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Postleitzahl/Ort: ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[5],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Stadt : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[4],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Telefon Nummer : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[6],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),
                              Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Lad-Referenz : ",
                                        style: TextStyle(fontSize: 20,
                                            color: Colors.green.shade900,
                                            fontFamily: "Lemonada"),
                                      ),
                                      TextSpan(
                                        text: Data.infoStepFour[7],
                                        style: const TextStyle(fontSize: 15,
                                            fontFamily: "Lemonada"),

                                      ),
                                    ],
                                  )
                              ),


                            ],)),


                        ],
                      ),
                      const Divider(color: Colors.black, endIndent: 100),


                      // الدفع
                      Text("Zahlungsarten",
                        style: TextStyle(fontSize: 20, color: Colors.red
                            .shade900, fontFamily: "Lemonada"),),
                      Text("Gesamtzahlung : ${Data.totPrice} EUR ",
                        style: TextStyle(fontSize: 15, color: Colors.blue
                            .shade900, fontFamily: "Lemonada"),),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsetsDirectional.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(22),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(0, 150, 50, 40),
                                Color.fromRGBO(0, 200, 60, 92),
                              ]),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            await addData();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          splashColor: const Color.fromRGBO(30, 30, 30, .51),
                          child: const Text(
                            'Per Rechnung zahlen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontFamily: 'Lemonada',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsetsDirectional.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(0, 150, 50, 40),
                                Color.fromRGBO(0, 200, 60, 92),
                              ]),),

                        child: TextButton.icon(
                          onPressed: () {

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => PaypalPayment(
                                  onFinish: (number) async {
                                    // payment done
                                    print('order id: ' + number);
                                  },
                                ),
                              ),
                            );

                          },

                          icon: const Icon(Icons.paypal, color: Colors.black),
                          label: const Text(
                            "Zahlen Sie über PayPal", style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontFamily: 'Lemonada',
                          ),),
                        ),
                      ),


                    ],
                  ),
                ),
              ),

            ),
          ],),
      );
    }

}