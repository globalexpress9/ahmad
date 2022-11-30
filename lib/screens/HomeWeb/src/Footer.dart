import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 15),
                  Text("Global Express",style: TextStyle(color: Color(0xff04005D),fontSize: 25,fontFamily: "Lemonada"),),
                  SizedBox(height: 10),
                  Text("www.az-express.de",style: TextStyle(color: Color(0xff0E0B67),fontSize: 18,fontFamily: "Lemonada"),),
                  SizedBox(height: 5),
                  Text("globalexpress@az-express.de",style: TextStyle(color: Color(0xff0E0B67),fontSize: 17,fontFamily: "Lemonada"),),

                ],
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text("Sonderfahrten",style: TextStyle(color: Color(0xff04005D),fontSize: 25,fontFamily: "Lemonada"),),
                  SizedBox(height: 15),
                  Text("Pakete\nTransport alle Arten\nExpress\nBreife",style: TextStyle(color: Color(0xff0E0B67),fontSize: 15,fontFamily: "Lemonada"),),

                ],
              ),

            ],
          ),

          //
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Resources',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black,
          //               fontWeight: FontWeight.w800,
          //               fontSize: 14.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Home',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Find a Team',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Publish a Project',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'About',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'About',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black,
          //               fontWeight: FontWeight.w800,
          //               fontSize: 14.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'General Info',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Tariffs',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'FAQ\'s',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Contacts',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //
          //     //same thing like first is repeated....
          //
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Free Tools',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black,
          //               fontWeight: FontWeight.w800,
          //               fontSize: 14.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Community',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Project Management',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Statistics',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Legal',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black,
          //               fontWeight: FontWeight.w800,
          //               fontSize: 14.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Privacy Policy',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Terms of Use',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 4.0),
          //           child: Text(
          //             'Payments',
          //             style: GoogleFonts.nunito(
          //               color: Colors.black54,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12.0,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 40.0,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(
          //       Icons.copyright_rounded,
          //       color: Colors.black54,
          //       size: 15.0,
          //     ),
          //     Text(
          //       '2020 All rights reserved',
          //       style: GoogleFonts.nunito(
          //         color: Colors.black54,
          //         fontWeight: FontWeight.w500,
          //         fontSize: 12.0,
          //       ),
          //     ),
          //   ],
          // ),



        ],
      ),
    );
  }
}
