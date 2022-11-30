
// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../HomeWeb/Services/PlatformServices.dart';




class  Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController repass = TextEditingController();
  String r_password = "";
  bool  _showPass = true;
  late SharedPreferences sharedPreferences;

  showSnakBar(String mss){
    var snackBar = SnackBar(
      elevation: 0.0,
      padding: const EdgeInsetsDirectional.all(5),
      margin: const EdgeInsetsDirectional.all(5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 1),
      content: AwesomeSnackbarContent(
        title: 'Oop !',
        color: Colors.red,
        message:"      $mss",
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
  _showDialog(String s,bool w) {
    ///////////////

    if(s!="Ein Bestätigungslink wurde an Ihre E-Mail gesendet, bestätigen Sie ihn und melden Sie sich an") {
      showDialog(barrierDismissible: false,context: context, builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,

          elevation: 10,
          scrollable: false,
          title: w ? const Center(child: CircularProgressIndicator(color: Colors.green,strokeWidth: 3),) :Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.error),
              SizedBox(width: 10),
              Text(
                "Notiz",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18,fontFamily: "Lemonada"),
              ),
            ],
          ),
          content: w ?  const Text("Angemeldet", textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontFamily: "Lemonada"),)
              : Text(s, textAlign: TextAlign.center,style: const TextStyle(fontSize: 20,fontFamily: "Lemonada"),),
          actions: [
            Visibility(
              visible: !w,
              child: MaterialButton(
                color: Colors.green,
                child: const Text("Gut",
                    style: TextStyle(fontSize: 14, fontFamily: "Lemonada")),
                onPressed: () async{
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        );},);
    }

    else{
      showDialog(barrierDismissible: false,context: context, builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,

          elevation: 10,
          scrollable: false,
          title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.schedule_send_outlined),
              SizedBox(width: 10),
              Text("wurde gesendet",textAlign: TextAlign.center, style: TextStyle(fontSize: 17, fontFamily: "Lemonada"),)
            ],
          ),
          content:  Text(s,textAlign: TextAlign.center,style: const TextStyle(fontSize: 17, fontFamily: "Lemonada")),
          actions: [
            Visibility(
              visible: !w,
              child: MaterialButton(
                color: Colors.green,
                child: const Text("Gut",
                    style: TextStyle(fontSize: 14, fontFamily: "Lemonada")),
                onPressed: () async{Navigator.pop(context);Navigator.pop(context);},

              ),
            ),

          ],
        );},);
    }

    ///////////////
  }


  addData(nameuser,emailuser,passworduser)async{

    // serach user
    var searchEmail = await
    client
        .from("users")
        .select()
        .eq("email",EMAILUSER).execute() ;

    List<dynamic> l = searchEmail.data;

  //  print("Resulr Data Search ");
    //print(l);

    if(l.isEmpty){
    //  print("truee");


      ////// add
      var respons = await client.from("users").insert({
        "name" : NAMEUSER,
        "email" :EMAILUSER,
        "password" : PASSWORDUSER,
      }).execute();

      if(respons.error != null) {
        Navigator.pop(context);
        if(respons.error?.message == "XMLHttpRequest error.") {
          showSnakBar("Die Internetverbindung ist sehr langsam");
          return;
        }
        else {
          showSnakBar("  ${respons.error?.message}  ");
          return;
        }


      }

    }
    Navigator.pop(context);
    _showDialog("Ein Bestätigungslink wurde an Ihre E-Mail gesendet, bestätigen Sie ihn und melden Sie sich an",false);
  }
  /// التسجيل
  signUp()async{

    if(EMAILUSER == "")
    {showSnakBar("Mail darf nicht leer sein");return;}
    else if(PASSWORDUSER == "")
    {showSnakBar("Das Passwort darf nicht leer sein");return;}
    else if(NAMEUSER == ""){
     showSnakBar("Sie müssen zuerst den Namen eingeben");
      return;}
    else if(!EMAILUSER.contains('@')){
    showSnakBar("Falsche Email");
    return;
    }
    else if(PASSWORDUSER.length < 6){
      showSnakBar("Das Passwort ist zu kurz");
      return;

    }
    else if(PASSWORDUSER != r_password ){showSnakBar("Passwörter stimmen nicht überein");return;}

    else {
      ///  loding.........
      _showDialog("",true);

      // Sign up user with email and password
      final response = await client.auth.signUp(EMAILUSER, PASSWORDUSER);

      if (response.error != null) {
        Navigator.pop(context);
        if (response.error?.message == "XMLHttpRequest error.") {
          showSnakBar("Die Internetverbindung ist sehr langsam");
          return;
        }
        else {
          showSnakBar("Die Internetverbindung ist sehr langsam");
          return;
        }

      }
      else {
        // Success

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("EMAILUSER",EMAILUSER);
        sharedPreferences.setString("PASSWORDUSER",PASSWORDUSER) ;
        sharedPreferences.setString("NAMEUSER",NAMEUSER);


        addData(NAMEUSER,EMAILUSER,PASSWORDUSER);


        /////////////////////////
      }



    }

///////END
  }




  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return SafeArea(
      child: Scaffold(
       //  backgroundColor: const Color.fromRGBO(10, 10, 10, 1),
        appBar: AppBar(
          backgroundColor: Color(0xff373e98),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.network("https://i.imgur.com/OtoorWN.jpg",fit: BoxFit.fill),
            Center(
                child:  Container(
                  width: PlatFormServices.isMobile(context) ? width * 0.9 : width * 0.7,
                  height: height * 0.98,
                  padding: const EdgeInsetsDirectional.only(start: 18,end: 18),
                  decoration:  BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                  ),
                  child:SingleChildScrollView(
                    child:Column(
                      children: [
                        Image.network("https://i.imgur.com/v3uXEGM.png",height: height* 0.2,width: width,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [

                            const SizedBox(
                              width: 330,
                              child:  Text("Name",style: TextStyle(fontSize: 25,fontFamily: "Satisfy-Regular"),),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 350,
                              child: buildemail(true),
                            ),
                            SizedBox(height: height * 0.01),


                            const SizedBox(
                              width: 330,
                              child: Text("Email",style: TextStyle(fontSize: 25,fontFamily: "Satisfy-Regular"),),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width:350,
                              child:   buildemail(false),
                            ),
                            SizedBox(height: height * 0.01),


                            const SizedBox(
                              width:330,
                              child:  Text("Password",style: TextStyle(fontSize: 25,fontFamily: "Satisfy-Regular"),),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 350,
                              child:  buildpass(1),
                            ),
                            SizedBox(height: height * 0.01),

                            const SizedBox(
                              width:330,
                              child:  Text("Re-Password",style: TextStyle(fontSize: 25,fontFamily: "Satisfy-Regular"),),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 350,
                              child:  buildpass(2),
                            ),
                            SizedBox(height: height * 0.01),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PlatFormServices.isMobile(context) ?  const Text("Do you already have an account?", style: TextStyle(fontWeight: FontWeight.bold,fontSize:11,fontFamily: "Lemonada"))
                                    :
                                  const Text("Do you already have an account?", style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,fontFamily: "Lemonada"),


                                 ),
                                TextButton(
                                  onPressed: () { Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false); },
                                  child:PlatFormServices.isMobile(context) ?
                                  Text(
                                    'Login',
                                    style: TextStyle(fontSize:10,color: Colors.blue.shade900,fontFamily: "Lemonada",fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                                  )
                                      :
                                  Text(
                                    'Login',
                                    style: TextStyle(fontSize:16,color: Colors.blue.shade900,fontFamily: "Lemonada",fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            buldbuttonlogin(),
                            const SizedBox(height: 30,)
                          ],
                        ),
                      ],
                    ),
                ),


            ),
              ),
          ],
        ),
      ),
    );
  }


  Widget buildemail(bool a) => TextFormField(
    keyboardType: TextInputType.emailAddress,
    onChanged: (e){
      if(a) {
        NAMEUSER = e;
      } else {
        EMAILUSER=e;
      }
      },
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2.5,
          color: Colors.black12
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: GradientOutlineInputBorder(
        width: 3.0,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade800,
              Colors.green.shade800,
            ]),
      ),
      prefixIcon: a ?const Icon(Icons.person, color: Colors.white) : const Icon(Icons.email_rounded, color: Colors.white),
      filled: true,
      fillColor: Colors.black.withOpacity(0.5),
    ),
  );
  Widget buildpass(int a) => TextFormField(
    keyboardType: TextInputType.visiblePassword,
    style: const TextStyle(color: Colors.white),
    obscureText: _showPass,
    onChanged: (e){
      if(a==1) {
        PASSWORDUSER=e;
      } else {
        r_password=e;
      }
      },
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2.5,
            color: Colors.black12
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: GradientOutlineInputBorder(
        width: 3.0,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade800,
              Colors.green.shade800,
            ]),
      ),
      prefixIcon: const Icon(Icons.lock, color: Colors.white),
      suffixIcon: IconButton(
        onPressed: (){setState(() {_showPass = !_showPass; });},
        icon: Icon(_showPass ? Icons.visibility : Icons.visibility_off , color: Colors.white ),
      ),
      filled: true,
      fillColor: Colors.black.withOpacity(0.5),
    ),
  );
  Widget buldbuttonlogin() => Container(
    width: 150,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
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
      onPressed: signUp,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      splashColor: const Color.fromRGBO(30, 30, 30, .51),
      child:  const Text(
        'Create',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'Satisfy-Regular',
        ),
      ),
    ),
  );

}

