
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import '../../../constant.dart';
import '../../HomeWeb/Services/PlatformServices.dart';


class StepTwo extends StatefulWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}



class _StepTwoState extends State<StepTwo> {

  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();
  GlobalKey<FormState> formstate5 = GlobalKey();
  GlobalKey<FormState> formstate6 = GlobalKey();

  // double width = 3 ;
  // int indexPacket = 1;
  // List<Widget> packet = [];
  // addPackeg(){
  //   packet.add(
  //       Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //
  //
  //       Text("PAckstuck ${++indexPacket}"),
  //       const SizedBox(height: 10),
  //       const Text("Menge"),
  //       const SizedBox(height: 5),
  //       TextFormField(
  //         decoration: const InputDecoration(
  //             border: OutlineInputBorder(
  //               gapPadding: 1,
  //               // borderRadius: BorderRadius.all(Radius.circular(20)),
  //             ),
  //
  //             fillColor: Colors.white10,
  //             focusColor: Colors.white10,
  //             hoverColor: Colors.white10
  //         ) ,
  //       ),
  //       const SizedBox(height: 10),
  //       const Text("Guter (was wrid versandt?)"),
  //       const SizedBox(height: 5),
  //       TextFormField(
  //         decoration: const InputDecoration(
  //             border: OutlineInputBorder(
  //               gapPadding: 1,
  //               // borderRadius: BorderRadius.all(Radius.circular(20)),
  //             ),
  //
  //             fillColor: Colors.white10,
  //             focusColor: Colors.white10,
  //             hoverColor: Colors.white10
  //         ) ,
  //       ),
  //       const SizedBox(height: 10),
  //       const Text("Gewicht (km pro Packstuck)"),
  //       const SizedBox(height: 5),
  //       TextFormField(
  //         decoration: const InputDecoration(
  //             border: OutlineInputBorder(
  //               gapPadding: 1,
  //               // borderRadius: BorderRadius.all(Radius.circular(20)),
  //             ),
  //
  //             fillColor: Colors.white10,
  //             focusColor: Colors.white10,
  //             hoverColor: Colors.white10
  //         ) ,
  //       ),
  //       const SizedBox(height: 10),
  //       const Text("Lange (cm pro Packstuck)"),
  //       const SizedBox(height: 5),
  //       TextFormField(
  //         decoration: const InputDecoration(
  //             border: OutlineInputBorder(
  //               gapPadding: 1,
  //               // borderRadius: BorderRadius.all(Radius.circular(20)),
  //             ),
  //
  //             fillColor: Colors.white10,
  //             focusColor: Colors.white10,
  //             hoverColor: Colors.white10
  //         ) ,
  //       ),
  //       const SizedBox(height: 10),
  //       const Text("Breite (cm pro Packstuck)"),
  //       const SizedBox(height: 5),
  //       TextFormField(
  //         decoration: const InputDecoration(
  //             fillColor: Colors.white10,
  //             focusColor: Colors.white10,
  //             hoverColor: Colors.white10
  //         ) ,
  //       ),
  //       const SizedBox(height: 10),
  //       const Text("Hohe (cm pro Packstuck)"),
  //       const SizedBox(height: 5),
  //       TextFormField(
  //         decoration: const InputDecoration(
  //             border: OutlineInputBorder(
  //               gapPadding: 1,
  //               // borderRadius: BorderRadius.all(Radius.circular(20)),
  //             ),
  //
  //             fillColor: Colors.white10,
  //             focusColor: Colors.white10,
  //             hoverColor: Colors.white10
  //         ) ,
  //       ),
  //       const SizedBox(height: 5),
  //       const Divider(color: Colors.purple,thickness: 3),
  //
  //
  //     ],
  //   ));
  //   setState(() {});
  // }


final   serviceId = 'service_sw93qoh';
final   templateId = 'template_r6crbqg';
final   userId = 'NlcwOeiea-CivRwpn';


goToStepThree(){

  if(formstate1.currentState!.validate() && formstate2.currentState!.validate()
    && formstate3.currentState!.validate() && formstate4.currentState!.validate()
    && formstate5.currentState!.validate() && formstate6.currentState!.validate() ) {
    Navigator.of(context).pushNamedAndRemoveUntil('StepFour', (route) => false);
  } else {}


}


  @override
  Widget build(BuildContext context) {
   double width  = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network("https://i.imgur.com/qAo2QJ9.jpg",fit: BoxFit.fill),
          Center(
            child: Container(
              width: PlatFormServices.isMobile(context) ? width * 0.9 : width * 0.5,
              height: height * 0.9,
              decoration:  BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: const BorderRadius.all( Radius.circular(20)),
              ),

              padding: EdgeInsetsDirectional.all(width*0.03),
              child:  SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Text("Paket",style: TextStyle(fontSize: 20,fontFamily: "Lemonada"),),
                    const SizedBox(height: 15),
                    const SizedBox(
                      width: 330,
                      child:Text("Menge",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate1,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                            else if(e.length>8) {
                              return "Die Zahl ist zu groß(älter als 99999999)";
                            }
                           else
                              Data.infoPackstuck[0]=e;

                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.green.shade800,
                              ),
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: GradientOutlineInputBorder(
                              width: 3.0,
                              // borderRadius: BorderRadius.circular(20),
                              gradient:  LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green.shade500,
                                    Colors.green.shade700,
                                    Colors.black38,
                                  ]),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                        ),
                      ) ,
                    ),
                    const SizedBox(height: 15),


                    const SizedBox(
                      width: 330,
                      child: Text("Guter (was wrid versandt?)",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate2,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                            else if(e.length>20) {
                              return "Der Eintrag muss weniger als 20 Zeichen lang sein";
                            }
                           else
                              Data.infoPackstuck[1]=e;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.green.shade800,
                              ),
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: GradientOutlineInputBorder(
                              width: 3.0,
                              // borderRadius: BorderRadius.circular(20),
                              gradient:  LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green.shade500,
                                    Colors.green.shade700,
                                    Colors.black38,
                                  ]),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                        ),
                      ) ,
                    ),
                    const SizedBox(height: 15),


                    const SizedBox(
                      width: 330,
                      child: Text("Gewicht (km pro Packstuck)",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate3,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                            else if(e.length>20) {
                              return "Der Eintrag muss weniger als 6 Zeichen lang sein";
                            }
                           else
                              Data.infoPackstuck[2]=e;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.green.shade800,
                              ),
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: GradientOutlineInputBorder(
                              width: 3.0,
                              // borderRadius: BorderRadius.circular(20),
                              gradient:  LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green.shade500,
                                    Colors.green.shade700,
                                    Colors.black38,
                                  ]),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                        ),
                      ) ,
                    ),
                    const SizedBox(height: 15),

                    const SizedBox(
                      width: 330,
                      child: Text("Lange (cm pro Packstuck)",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate4,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                            else if(e.length>20) {
                              return "Der Eintrag muss weniger als 6 Zeichen lang sein";
                            }
                            else
                              Data.infoPackstuck[3]=e;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.green.shade800,
                              ),
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: GradientOutlineInputBorder(
                              width: 3.0,
                              // borderRadius: BorderRadius.circular(20),
                              gradient:  LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green.shade500,
                                    Colors.green.shade700,
                                    Colors.black38,
                                  ]),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                        ),
                      ) ,
                    ),
                    const SizedBox(height: 15),

                    const SizedBox(
                      width: 330,
                      child:  Text("Breite (cm pro Packstuck)",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate5,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                            else if(e.length>20) {
                              return "Der Eintrag muss weniger als 6 Zeichen lang sein";
                            }
                           else
                              Data.infoPackstuck[4]=e;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.green.shade800,
                              ),
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: GradientOutlineInputBorder(
                              width: 3.0,
                              // borderRadius: BorderRadius.circular(20),
                              gradient:  LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green.shade500,
                                    Colors.green.shade700,
                                    Colors.black38,
                                  ]),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                        ),
                      ) ,
                    ),
                    const SizedBox(height: 15),


                    const SizedBox(
                      width: 330,
                      child:Text("Hohe (cm pro Packstuck)",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate6,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                            else if(e.length>20) {
                              return "Der Eintrag muss weniger als 6 Zeichen lang sein";
                            }
                            else
                              Data.infoPackstuck[5]=e;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2.5,
                                color: Colors.green.shade800,
                              ),
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: GradientOutlineInputBorder(
                              width: 3.0,
                              // borderRadius: BorderRadius.circular(20),
                              gradient:  LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.green.shade500,
                                    Colors.green.shade700,
                                    Colors.black38,
                                  ]),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                        ),
                      ) ,
                    ),
                    const SizedBox(height: 5),

                    const SizedBox(
                      width: 350,
                      child: Divider(color: Colors.black12,thickness: 3),),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('StepThird', (route) => false);},
                          color: Colors.green,
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_back),),
                        IconButton(onPressed: goToStepThree,
                          color: Colors.green,
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_forward),),
                      ],
                    ),



                  ],
                ),
              ),

            ),
          ),
        ],
      ),

    );

  }
}
