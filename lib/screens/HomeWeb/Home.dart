import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/screens/HomeWeb/src/Footer.dart';
import 'package:web/screens/HomeWeb/src/Header.dart';
import 'package:web/screens/HomeWeb/src/InfoPalette.dart';
import 'package:web/screens/HomeWeb/src/ProfileImage.dart';
import 'package:web/screens/HomeWeb/src/ProfileTile.dart';
import 'package:web/screens/HomeWeb/src/TestimonialTile.dart';

import '../../main.dart';
import '../web/login.dart';
import '../web/steps/stepOne.dart';
import 'Services/PlatformServices.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  _HomePageWebState createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  late ScrollController _controller;
  double pixels = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        pixels = _controller.position.pixels;
        print(_controller.position.pixels);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          controller: _controller,
          child: PlatFormServices.isMobile(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 1000.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Stack(
                                children: [
                                  Transform(
                                    transform: Matrix4.rotationZ(pi / 13)
                                      ..translate(-180.0, 170.0),
                                    child: Container(
                                      height: 350.0,
                                      width: 700.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(300.0),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 80.0,
                                    left: 15.0,
                                    child: SizedBox(
                                      height: 400.0,
                                      width: 400.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Global Exprees',
                                            style: GoogleFonts.lemonada(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            'Transportieren Sie\n Ihre Ware sicher',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          Text(
                                            'Sie können alle Arten von Gütern bequem,\n sicher und zu wettbewerbsfähigen\n Preisen an jeden Ort transportieren',
                                            style: GoogleFonts.nunito(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          const SizedBox(width: 25.0),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                                builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                                builder:(_) =>   const Login()));},
                                            child: SizedBox(
                                              height: 45.0,
                                              width: 180.0,
                                              child: Center(
                                                child: Text(
                                                  'Buchen Sie jetzt',
                                                  style: GoogleFonts.nunito(
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const ProfileImage(
                                    top: 380.0,
                                    left: 150.0,
                                    diameter: 200.0,
                                    image:
                                        'https://images.pexels.com/photos/4968429/pexels-photo-4968429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                    //  'images/car.jpg',
                                  ),
                                  const ProfileImage(
                                    top: 520.0,
                                    left: 50.0,
                                    diameter: 100.0,
                                    image:
                                        'https://c1.wallpaperflare.com/preview/968/1012/52/cargo-cars-delivery-drive.jpg',
                                    //'images/imageHome.png',
                                  ),
                                  const ProfileImage(
                                    top: 620.0,
                                    left: 60.0,
                                    diameter: 280.0,
                                    image:
                                        'https://images.pexels.com/photos/5025503/pexels-photo-5025503.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                                    //  'images/car.jpg',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: const Color(0xff373e98),
                          height: 60.0,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Icon(
                                Icons.car_repair_sharp,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Global Express',
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    textStyle:
                                        const TextStyle(fontFamily: "Lemonada"),
                                    fontSize: 15.0),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "+49 176 627 997 32",
                                      style:  TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 700.0,
                      width: double.infinity,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            right: -300.0,
                            child: Container(
                              height: 130.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(300.0),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Unsere Firmenmerkmale', // 'How it works',
                                style: GoogleFonts.lemonada(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              AnimatedOpacity(
                                opacity: pixels >= 450 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 500),
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 500),
                                  padding: EdgeInsets.only(
                                      left: pixels >= 550 ? 1.0 : 700.0),
                                  child: InfoPalette(
                                    title: 'Einfache Zahlung', // 'Community',
                                    text:
                                        'Sie können direkt per Rechnung oder per Paypal bezahlen', // 'Communicate with colleagues, share ideas, find a team in a project in one space.',
                                    icon: Icons.payment,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              AnimatedOpacity(
                                opacity: pixels >= 550 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 800),
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 800),
                                  padding: EdgeInsets.only(
                                      left: pixels >= 650 ? 1.0 : 800.0),
                                  child: InfoPalette(
                                    title:
                                        'Zuverlässig und sicher', // 'Overview Reports',
                                    text:
                                        'Wir haben Sicherheit und Vertraulichkeit in Ihren Daten', // 'Track your progress thanks to the reporting system right inside the platform.',
                                    icon: Icons.security,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              AnimatedOpacity(
                                opacity: pixels >= 750 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 800),
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 800),
                                  padding: EdgeInsets.only(
                                      left: pixels >= 850 ? 1.0 : 700.0),
                                  child: InfoPalette(
                                    title: '24h Den ganzen Tag', // 'Dashboard',
                                    text:
                                        'Wir arbeiten immer den ganzen Tag, Sie können jederzeit bei uns buchen und die für Sie passenden Be- und Entladezeiten bestimmen', //  'Manage your projects and tasks by tracking activity on the dashboard.',
                                    icon: Icons.timer,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  primary: Colors.black87,
                                  padding: const EdgeInsets.all(0.0),
                                ),
                                onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                    builder:(_) =>   const Login()));},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                    vertical: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    border: Border.all(
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                  child: Text(
                                    'Reservierung', //'Explore More',
                                    style: GoogleFonts.nunito(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: -250.0,
                            child: Container(
                              height: 350.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.amber[400],
                                borderRadius: BorderRadius.circular(300.0),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            top: 20.0,
                            left: pixels >= 1250 ? 0.0 : -100.0,
                            child: Container(
                              height: 250.0,
                              width: 300.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                //'https://miro.medium.com/max/2400/0*qO2PFu6dr04R1O6P.png',
                                'assets/images/car.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ProfileTile(
                            left: 10.0,
                            top: -10.0,
                            title:
                                'neueste Lastwagen', //'Send a final design to the team',
                            subTitle: '------------------', //'Sara, Client',
                            factor: 1.0,
                          ),
                          ProfileTile(
                            left: 150.0,
                            top: 250.0,
                            title:
                                'Neueste Technik', //'Publish Your project whenever you want',
                            subTitle: '--------------', //'Micheal',
                            factor: 1.0,
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 800),
                            right: pixels >= 1450 ? 10.0 : -10.0,
                            top: 20.0,
                            left: 20,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 800),
                              opacity: pixels >= 1480 ? 1.0 : 0.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.6),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(20))),
                                    padding: const EdgeInsetsDirectional.all(15),
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Einfach navigieren',
                                          style: GoogleFonts.lemonada(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 19.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        SizedBox(
                                          width: 280.0,
                                          child: Text(
                                            'Bewegen Sie sich schnell und einfach\n zwischen den Regionen Deutschlands,\n denn wir bieten Ihnen die besten\n Dienstleistungen zu günstigen Preisen',
                                            style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      backgroundColor: Colors.grey[900],
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0,
                                        vertical: 20.0,
                                      ),
                                    ),
                                    onPressed: () {

                                      NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                          builder:(_) =>   const Login()));
                                    },
                                    child: Text(
                                      'Beginnend',
                                      style: GoogleFonts.nunito(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'unsere Kunden',
                                  style: GoogleFonts.lemonada(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.0,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Wir haben ausgezeichnete Bewertungen\n von unseren angesehenen Kunden erhalten',
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 700),
                            alignment: pixels >= 1350
                                ? const Alignment(0.1, 0.1)
                                : const Alignment(-0.2, 0.0),
                            child: AnimatedOpacity(
                              opacity: pixels >= 1780 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 700),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: 5.0,
                                        top: 30.0,
                                        child: Icon(
                                          Icons.format_quote,
                                          color: Colors.grey[300],
                                          size: 80.0,
                                        ),
                                      ),
                                      Text(
                                        'Exzellenz',
                                        style: GoogleFonts.lemonada(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    width: 360.0,
                                    child: Text(
                                      'Schnelligkeit, Leichtigkeit, Sicherheit, Zuverlässigkeit und sehr günstige Preise',
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Global Express',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    width: 100.0,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 40.0,
                            top: 140.0,
                            child: Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    offset: Offset(0.5, 10.0),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            top: 150.0,
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.yellow[800],
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    offset: Offset(0.6, 10.0),
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 80.0,
                            top: 360.0,
                            child: Container(
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.green[800],
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    offset: const Offset(0.6, 10.0),
                                    color: Colors.green.shade800,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600.0,
                      color: const Color(0xff373e98),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 500),
                            alignment: pixels >= 2100
                                ? const Alignment(0.0, 1.0)
                                : const Alignment(-0.2, 1.0),
                            child: AnimatedOpacity(
                              opacity: pixels >= 2110 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 500),
                              child: SizedBox(
                                height: 600.0,
                                width: 500.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 80.0,
                                    ),
                                    Text(
                                      'Beginnen Sie noch heute',
                                      style: GoogleFonts.lemonada(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.0,
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Zögern Sie nicht, bei uns zu buchen',
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                              builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                              builder:(_) =>   const Login()));},
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              backgroundColor: Colors.white,
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                            ),
                                            onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                                builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                                builder:(_) =>   const Login()));},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 30.0,
                                                vertical: 12.0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              child: Text(
                                                'Anfang',
                                                style: GoogleFonts.josefinSans(
                                                  color:
                                                      const Color(0xff373e98),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20.0,
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                              height: 300.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[300],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [

                                      SizedBox(height: 10),
                                      Text("Sonderfahrten",style: TextStyle(color: Color(0xff04005D),fontSize: 18,fontFamily: "Lemonada"),),
                                      SizedBox(height: 10),
                                      Text("Pakete\nTransport alle Arten\nExpress\nBreife",style: TextStyle(color: Color(0xff0E0B67),fontSize: 12,fontFamily: "Lemonada"),),

                                      SizedBox(height: 25),
                                      Text("Global Express",style: TextStyle(color: Color(0xff04005D),fontSize: 18,fontFamily: "Lemonada"),),
                                      SizedBox(height: 10),
                                      Text("www.az-express.de",style: TextStyle(color: Color(0xff0E0B67),fontSize: 14,fontFamily: "Lemonada"),),
                                      SizedBox(height: 5),
                                      Text("globalexpress@az-express.de",style: TextStyle(color: Color(0xff0E0B67),fontSize: 12,fontFamily: "Lemonada"),),






                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                )
////////////////////////////////////////////////////////////////////////
              : Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 600.0,
                              width: MediaQuery.of(context).size.width * 0.45,
                              color: Colors.white,
                              child: Stack(
                                children: [
                                  Transform(
                                    transform: Matrix4.rotationZ(pi / 6)
                                      ..translate(-180.0, 170.0),
                                    child: Container(
                                      height: 350.0,
                                      width: 700.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(300.0),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 200.0,
                                    left: 100.0,
                                    child: SizedBox(
                                      height: 400.0,
                                      width: 400.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Global Exprees',
                                            style: GoogleFonts.lemonada(
                                              fontSize: 38.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            'Transportieren Sie Ihre Ware sicher',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          SizedBox(
                                            width: 300.0,
                                            child: Text(
                                              'Sie können alle Arten von Gütern bequem, sicher und zu wettbewerbsfähigen Preisen an jeden Ort transportieren',
                                              style: GoogleFonts.nunito(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 30.0),
                                          const SizedBox(width: 20.0),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                            ),
                                            onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                                builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                                builder:(_) =>   const Login()));},
                                            child: SizedBox(
                                              height: 45.0,
                                              width: 100.0,
                                              child: Center(
                                                child: Text(
                                                  'Buchen Sie jetzt',
                                                  style: GoogleFonts.nunito(
                                                    color: Colors.white,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 600.0,
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const ProfileImage(
                                    top: 140.0,
                                    left: 90.0,
                                    diameter: 200.0,
                                    image:
                                        'https://images.pexels.com/photos/4968429/pexels-photo-4968429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                    //  'images/car.jpg',
                                  ),
                                  const ProfileImage(
                                    top: 160.0,
                                    left: 310.0,
                                    diameter: 100.0,
                                    image:
                                        'https://c1.wallpaperflare.com/preview/968/1012/52/cargo-cars-delivery-drive.jpg',
                                    //'images/imageHome.png',
                                  ),
                                  const ProfileImage(
                                    top: 275.0,
                                    left: 280.0,
                                    diameter: 280.0,
                                    image:
                                        'https://images.pexels.com/photos/5025503/pexels-photo-5025503.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                                    //  'images/car.jpg',
                                  ),
                                  const ProfileImage(
                                    top: 360.0,
                                    left: 90.0,
                                    diameter: 170.0,
                                    image:
                                        'https://c0.wallpaperflare.com/preview/622/190/436/logistics-lorry-mountains-nature.jpg',
                                    //  'images/car.jpg',
                                  ),
                                  ProfileTile(
                                    top: 380.0,
                                    left: 50.0,
                                    title:
                                        'die Geschwindigkeit', //'I am Gonna give u Color theory',
                                    subTitle:
                                        '-------------', //'Scarlett, Designer',
                                    factor: 0.5,
                                  ),
                                  ProfileTile(
                                    top: 140.0,
                                    left: -10.0,
                                    title:
                                        'Sicherheit', //'Photography is an Art, Lets do it ryt!',
                                    subTitle:
                                        '----------', // 'Harshell, Photographer',
                                    factor: 0.9,
                                  ),
                                  ProfileTile(
                                    top: 160.0,
                                    left: 380.0,
                                    title:
                                        'Die Leichtigkeit', //'I am Gonna give u Color theory',
                                    subTitle:
                                        '-----------', // 'Scarlett, Designer',
                                    factor: 0.4,
                                  ),
                                  ProfileTile(
                                    top: 270.0,
                                    left: 440.0,
                                    title:
                                        'Verlässlichkeit', // 'I am Gonna give u Color theory',
                                    subTitle:
                                        '--------------', //'Scarlett, Designer',
                                    factor: 1.1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Header(),
                      ],
                    ),
                    Container(
                      height: 400.0,
                      width: double.infinity,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Positioned(
                            right: -200.0,
                            child: Container(
                              height: 330.0,
                              width: 430.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(300.0),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'Unsere Firmenmerkmale', // 'How it works',
                                style: GoogleFonts.lemonada(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AnimatedOpacity(
                                    opacity: pixels >= 100 ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 500),
                                    child: AnimatedPadding(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      padding: EdgeInsets.only(
                                          left: pixels >= 100 ? 0.0 : 500.0),
                                      child: InfoPalette(
                                        title:
                                            'Einfache Zahlung', // 'Community',
                                        text:
                                            'Sie können direkt per Rechnung oder per Paypal bezahlen', // 'Communicate with colleagues, share ideas, find a team in a project in one space.',
                                        icon: Icons.payment,
                                      ),
                                    ),
                                  ),
                                  InfoPalette(
                                    title:
                                        'Zuverlässig und sicher', // 'Overview Reports',
                                    text:
                                        'Wir haben Sicherheit und Vertraulichkeit in Ihren Daten', // 'Track your progress thanks to the reporting system right inside the platform.',
                                    icon: Icons.security,
                                  ),
                                  InfoPalette(
                                    title: '24h Den ganzen Tag', // 'Dashboard',
                                    text:
                                        'Wir arbeiten immer den ganzen Tag, Sie können jederzeit bei uns buchen und die für Sie passenden Be- und Entladezeiten bestimmen', //  'Manage your projects and tasks by tracking activity on the dashboard.',
                                    icon: Icons.timer,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 60.0,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  primary: Colors.black87,
                                  padding: const EdgeInsets.all(0.0),
                                ),
                                onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                    builder:(_) =>   const Login()));},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                    vertical: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    border: Border.all(
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                  child: Text(
                                    'Reservierung', //'Explore More',
                                    style: GoogleFonts.nunito(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: -250.0,
                            child: Container(
                              height: 450.0,
                              width: 700.0,
                              decoration: BoxDecoration(
                                color: Colors.amber[400],
                                borderRadius: BorderRadius.circular(400.0),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            top: 20.0,
                            left: pixels >= 500 ? 100.0 : 0.0,
                            child: Container(
                              height: 400.0,
                              width: 700.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                //'https://miro.medium.com/max/2400/0*qO2PFu6dr04R1O6P.png',
                                'assets/images/car.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ProfileTile(
                            left: 80.0,
                            top: -10.0,
                            title:
                                'neueste Lastwagen', //'Send a final design to the team',
                            subTitle:
                                '-----------------------', //'Sara, Client',
                            factor: 1.0,
                          ),
                          ProfileTile(
                            left: 620.0,
                            top: 400.0,
                            title:
                                'Neueste Technik', //'Publish Your project whenever you want',
                            subTitle: '-------------------', //'Micheal',
                            factor: 1.0,
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 500),
                            right: pixels >= 600 ? 100.0 : 0.0,
                            top: 150.0,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: pixels >= 600 ? 1.0 : 0.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Einfach navigieren',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    width: 280.0,
                                    child: Text(
                                      'Bewegen Sie sich schnell und einfach zwischen den Regionen Deutschlands, denn wir bieten Ihnen die besten Dienstleistungen zu günstigen Preisen',
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      backgroundColor: Colors.grey[900],
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0,
                                        vertical: 20.0,
                                      ),
                                    ),
                                    onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                        builder:(_) =>   const Login()));},
                                    child: Text(
                                      'Beginnend',
                                      style: GoogleFonts.nunito(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 600.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Align(
                            child: Column(
                              children: [
                                Text(
                                  'unsere Kunden',
                                  style: GoogleFonts.lemonada(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25.0,
                                  ),
                                ),
                                Text(
                                  'Wir haben ausgezeichnete Bewertungen von unseren angesehenen Kunden erhalten',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 500),
                            alignment: pixels >= 1200
                                ? const Alignment(0.0, 0.0)
                                : const Alignment(-0.2, 0.0),
                            child: AnimatedOpacity(
                              opacity: pixels >= 1200 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 500),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: -70.0,
                                        top: -60.0,
                                        child: Icon(
                                          Icons.format_quote,
                                          color: Colors.grey[300],
                                          size: 150.0,
                                        ),
                                      ),
                                      Text(
                                        'Exzellenz',
                                        style: GoogleFonts.lemonada(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 30.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                    width: 360.0,
                                    child: Text(
                                      'Schnelligkeit, Leichtigkeit, Sicherheit, Zuverlässigkeit und sehr günstige Preise',
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Global Express',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    width: 100.0,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TestimonialTile(
                            image:
                                //'https://images.unsplash.com/photo-1565623006066-82f23c79210b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2134&q=80',
                                'images/car.jpg',
                            left: 780.0,
                            top: pixels >= 1000 ? 100.0 : 130.0,
                            leftalign: false,
                          ),
                          TestimonialTile(
                            image:
                                //  'https://images.unsplash.com/photo-1612282131293-37332d3cea00?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1995&q=80',
                                'images/car.jpg',
                            left: 840.0,
                            top: pixels >= 1200 ? 400.0 : 430.0,
                            leftalign: false,
                          ),
                          TestimonialTile(
                            image:
                                //  'https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1950&q=80',
                                'images/car.jpg',
                            left: 440.0,
                            top: pixels >= 1300 ? 450.0 : 480.0,
                            leftalign: true,
                          ),
                          Positioned(
                            right: 350.0,
                            top: 200.0,
                            child: Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    offset: Offset(0.0, 10.0),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //rest two also same only positions and size and color changes....
                          Positioned(
                            right: 200.0,
                            top: 250.0,
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    offset: Offset(0.0, 10.0),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 250.0,
                            top: 450.0,
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                color: const Color(0xff373e98),
                                borderRadius: BorderRadius.circular(60.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    offset: Offset(0.0, 10.0),
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600.0,
                      color: const Color(0xff373e98),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 500),
                            alignment: pixels >= 1600
                                ? const Alignment(0.0, 1.0)
                                : const Alignment(-0.2, 1.0),
                            child: AnimatedOpacity(
                              opacity: pixels >= 1600 ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 500),
                              child: SizedBox(
                                height: 600.0,
                                width: 500.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 80.0,
                                    ),
                                    Text(
                                      'Beginnen Sie noch heute',
                                      style: GoogleFonts.lemonada(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.0,
                                        fontSize: 25.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'Zögern Sie nicht, bei uns zu buchen',
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                              builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                              builder:(_) =>   const Login()));},
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              backgroundColor: Colors.white,
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                            ),
                                            onPressed: () {NAMEUSER != "" && EMAILUSER !="" && PASSWORDUSER !="" ?  Navigator.pushReplacement(context, MaterialPageRoute(
                                                builder:(_) =>    const StepOne())) :  Navigator.push(context, MaterialPageRoute(
                                                builder:(_) =>   const Login()));},
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 30.0,
                                                vertical: 12.0,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              child: Text(
                                                'Anfang',
                                                style: GoogleFonts.josefinSans(
                                                  color:
                                                      const Color(0xff373e98),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20.0,
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            child: Footer(),
                          ),
                          Align(
                            alignment: const Alignment(1.18, 0.0),
                            child: Container(
                              height: 200.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.amber[400],
                                borderRadius: BorderRadius.circular(100.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0, 5.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
