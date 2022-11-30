
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import '../../../constant.dart';
import '../../HomeWeb/Services/PlatformServices.dart';




class StepFour extends StatefulWidget {
  const StepFour({Key? key}) : super(key: key);

  @override
  State<StepFour> createState() => _StepFourState();
}



class _StepFourState extends State<StepFour> {



  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();
  GlobalKey<FormState> formstate5 = GlobalKey();
  GlobalKey<FormState> formstate6 = GlobalKey();
  GlobalKey<FormState> formstate7 = GlobalKey();
  GlobalKey<FormState> formstate8 = GlobalKey();
  GlobalKey<FormState> formstate9 = GlobalKey();
  goToStepFive(){

    if(formstate1.currentState!.validate() && formstate2.currentState!.validate()
        &&  formstate4.currentState!.validate()
        &&  formstate5.currentState!.validate()
         && formstate6.currentState!.validate()
        && formstate7.currentState!.validate() && formstate8.currentState!.validate() ) {
      Navigator.of(context).pushNamedAndRemoveUntil('StepFive', (route) => false);
    } else {
      print("NOOO");
    }

  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network("https://c0.wallpaperflare.com/preview/622/190/436/logistics-lorry-mountains-nature.jpg",fit: BoxFit.fill),


          Center(
            child: Container(
              width: PlatFormServices.isMobile(context) ? width * 0.9 : width * 0.5,
              height: height * 0.9,
              decoration:  BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all( Radius.circular(20)),
              ),

              padding: EdgeInsetsDirectional.all(width*0.03),
              child:  SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Zustellung eingeben",style: TextStyle(fontSize: 17,fontFamily: "Lemonada"),),
                    const SizedBox(height: 15),


                    const SizedBox(
                      width: 330,
                      child:Text("Firma",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                           else
                              Data.infoStepFour[0]=e;

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
                  child:Text("Ansprechparthner",style: const TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                            else
                              Data.infoStepFour[1]=e;
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
                      child:const Text("StraBe + Hausnr",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                          else
                              Data.infoStepFour[3]=e;
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
                      child: Text("Postleitzahl/Ort",style: const TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                           else
                              Data.infoStepFour[5]=e;
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



                    const SizedBox(
                      width: 330,
                      child:Text("Stadt",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
    else
      Data.infoStepFour[4]=e.toString();



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
                      child:  Text("Telefon Nummer",style: const TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate7,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                           else
                              Data.infoStepFour[6]=e.toString();
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



                    const SizedBox(
                      width: 330,
                      child: const Text("Lad-Referenz",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate8,
                        child: TextFormField(
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                           else
                              Data.infoStepFour[7]=e.toString();
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
                      width: 330,
                      child:  Text("Zusätzliche Bemerkungen",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 350,
                      child: Form(
                        key: formstate9,
                        child: TextFormField(
                          maxLines: 6,
                          onChanged: (r){Data.infoStepFour[8]=r.toString();},
                          validator: (e){
                            if(e!.isEmpty) {
                              return "Bitte geben Sie das Feld ein";
                            }
                            Data.infoStepFour[8]=e.toString();
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
                          onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('StepTwo', (route) => false);},
                          color: Colors.green,
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_back),),
                        IconButton(onPressed: goToStepFive,
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
