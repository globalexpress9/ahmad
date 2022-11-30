import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/main.dart';
import 'package:web/screens/web/login.dart';

import '../../web/register.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff373e98),
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SizedBox(
            width: 100.0,
          ),
          const Icon(
            Icons.car_repair_sharp,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            'Global Express',
            style: GoogleFonts.nunito(color: Colors.white,textStyle: TextStyle(fontFamily: "Lemonada"),fontSize: 18.0),
          ),
          const SizedBox(
            width: 250.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeaderNav(
                selected: true,
                text: 'Home',
              ),
              const SizedBox(
                width: 40.0,
              ),
              // HeaderNav(
              //   selected: false,
              //   text: 'Find a Team',
              // ),
              const SizedBox(
                width: 40.0,
              ),
              // HeaderNav(
              //   selected: false,
              //   text: 'Publish a Project',
              // ),
              const SizedBox(
                width: 40.0,
              ),
              HeaderNav(
                selected: false,
                text: '+49 176 627 997 32',
              ),
            ],
          ),
          const SizedBox(
            width: 250.0,
          ),
          Visibility(
            visible: NAMEUSER == "" ? true : false,
              child:Row(
                children: [
                 TextButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(
                     builder:(_) =>   const Register()));},

                     child:Text( 'Sign Up',
                       style: GoogleFonts.nunito(
                         fontSize: 13.0,
                         color: Colors.white,
                       ),),
                 ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 20.0,
                    width: 1.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                 TextButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(
                     builder:(_) =>   const Login()));},
                     child:Text(
                       'Log In',
                       style: GoogleFonts.nunito(
                         fontSize: 13.0,
                         color: Colors.white,
                       ),
                     ),
                 ),
                ],
              ),
          ),

          Visibility(
            visible: NAMEUSER == "" ?  false :  true,
            child:Row(
              children: [
              CircleAvatar(
                child: Icon(Icons.person,color: Colors.black,),
              backgroundColor: Colors.white,
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderNav extends StatefulWidget {
  final String text;
  final bool selected;

  HeaderNav({
   required this.selected,
   required this.text,
  });
  @override
  _HeaderNavState createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: GoogleFonts.nunito(
            fontSize: 13.0,
            color: Colors.white,
          ),
        ),
        widget.selected
            ? const SizedBox(
                height: 5.0,
              )
            : const SizedBox(),
        widget.selected
            ? const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 2.0,
              )
            : const SizedBox(),
      ],
    );
  }
}
