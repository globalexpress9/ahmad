
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import '../../../constant.dart';
import '../../HomeWeb/Services/PlatformServices.dart';




class StepThird extends StatefulWidget {
  const StepThird({Key? key}) : super(key: key);

  @override
  State<StepThird> createState() => _StepThirdState();
}


String tim= "   ${DateTime.now().hour}:${DateTime.now().minute}     ";
String date="";

class _StepThirdState extends State<StepThird> {

  showSnakBar(String mss){

    var snackBar = SnackBar(
      elevation: 0.0,
      padding: const EdgeInsetsDirectional.all(5),
      margin: const EdgeInsetsDirectional.all(5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
      content: AwesomeSnackbarContent(
        title: 'Oop !',
        message:"      $mss",
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }


  GlobalKey<FormState> formstate1 = GlobalKey();
  GlobalKey<FormState> formstate2 = GlobalKey();
  GlobalKey<FormState> formstate3 = GlobalKey();
  GlobalKey<FormState> formstate4 = GlobalKey();
  GlobalKey<FormState> formstate5 = GlobalKey();
  GlobalKey<FormState> formstate6 = GlobalKey();
  GlobalKey<FormState> formstate7 = GlobalKey();
  GlobalKey<FormState> formstate8 = GlobalKey();

  goToStepFour(){
    if(formstate1.currentState!.validate() && formstate2.currentState!.validate()
        && formstate3.currentState!.validate() && formstate4.currentState!.validate()
         && formstate6.currentState!.validate()
        && formstate7.currentState!.validate() && formstate8.currentState!.validate() ) {
      Navigator.of(context).pushNamedAndRemoveUntil('StepTwo', (route) => false);


    } else {
      print("NOOO");
    }

  }



  // Date


  final DateTime time1 = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day),
        lastDate: DateTime(DateTime.now().year+10));
    if (picked != null && picked != selectedDate1) {
      setState(() {
        selectedDate1 = picked;
      });
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
          Image.network("https://images.pexels.com/photos/7203788/pexels-photo-7203788.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",fit: BoxFit.fill),
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


                    const Text("AUFTRAGGEBER",style: TextStyle(fontSize: 17,fontFamily: "Lemonada"),),
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
                            else {
                              Data.infoStepThird[0]=e.toString();
                            }

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
                      child: Text("Ansprechpartner",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                           else {
                              Data.infoStepThird[1]=e.toString();
                            }
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
                      width: 350,
                      child:Text("StraBe und Hausnummer (Erforderlich)",style: TextStyle(fontSize: 13,fontFamily: "Lemonada"),),
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
                           else {
                              Data.infoStepThird[2]=e.toString();
                            }
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
                      child:Text("Plz (Erforderlich)",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                          else {
                              Data.infoStepThird[3]=e.toString();
                            }
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
                      child:Text("Stadt",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                           else {
                              Data.infoStepThird[5]=e.toString();
                            }
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
                      child: Text("Telefon Nummer",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                           else {
                              Data.infoStepThird[6]=e.toString();
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
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
                      child:Text("Lad-Referenz",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
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
                            else {
                              Data.infoStepThird[7]=e.toString();
                            }
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









                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(tim,style: const TextStyle(fontSize: 12,fontFamily: "Lemonada"),),
                        const SizedBox(width: 20),
                        Text("${selectedDate1.toLocal()}".split(' ')[0],style: const TextStyle(fontSize: 12,fontFamily: "Lemonada"),),
                      ],
                    ),

                    const SizedBox(height: 10.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: time1.hour, minute: time1.minute),
                          ).then((TimeOfDay? value) {
                            if (value != null) {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text(value.format(context)),
                              //     action: SnackBarAction(label: 'OK', onPressed: () {}
                              //     ),
                              //   ),
                              // );
                              tim = value.format(context).toString();
                              setState(() {});
                            }
                          });
                        },
                        child: const Text('Zeit'),
                      ),
                        const SizedBox(width: 20),

                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Datum'),
                        ),

                    ],),
                    const SizedBox(height: 15.0,),


                    const SizedBox(
                      width: 350,
                      child: Divider(color: Colors.black12,thickness: 3),),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('StepOne', (route) => false);},
                          color: Colors.green,
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_back),),
                        IconButton(onPressed: goToStepFour,
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
