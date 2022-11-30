
// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/screens/web/register.dart';

import '../../main.dart';
import '../HomeWeb/Services/PlatformServices.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool _showPass = true;
   late SharedPreferences sharedPreferences;

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
                onPressed: () async{
                  //   Navigator.pop(context);

                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder:(_) =>   const Login()));


                },
              ),
            ),

          ],
        );},);
    }

    ///////////////
  }
   signIn()async{

    /// ERORR
    if( email.text  == "" || email.text.isEmpty) {
      showSnakBar("Geben sie ihre E-Mail Adresse ein");
     return;}

    else if( pass.text == "" || pass.text.isEmpty)
    {
      showSnakBar("Geben Sie das Passwort ein");
      return;}


    else if(!email.text.contains('@')){
      showSnakBar("Falsche Email");
      return;
    }
    else if(pass.text.length < 6){
      showSnakBar("Das Passwort ist inkorrekt");
          return;}

    else {
      // loding sin in
      _showDialog("",true);
      // Sign Ip user with email and password
      final response = await client.auth.signIn(email : email.text,password:pass.text);

      if (response.error != null) {
        // Error
        Navigator.pop(context);

        if(response.error?.message == "Email not confirmed") {
          showSnakBar("Verifizieren Sie zuerst Ihr Konto, um sich anmelden zu können");
          return;
        } else if(response.error?.message == "Failed host lookup: 'nxymjjgbbtsyvuqlnvuw.supabase.co'") {

          showSnakBar("Die Internetverbindung ist sehr langsam");
          return;}
        else{

         showSnakBar("E-Mail- oder Passwortfehler");

          return;
        }


      } else {
        // Success
        // "تم بتسيجل الدخول"

        var getinfo = await
        client
            .from("users")
            .select()
            .eq("email",email.text)
            .eq("password", pass.text)
            .execute();

        if(getinfo.error != null) {


          // ignore: use_build_context_synchronously
          Navigator.pop(context);



          if(getinfo.error?.message == "XMLHttpRequest error.") {
            showSnakBar("Die Internetverbindung ist sehr langsam");

            return;}
          showSnakBar("Die Internetverbindung ist sehr langsam");
          return;
        }

        final dataList = getinfo.data as List ;

        if(dataList.isNotEmpty) {
          //print("LOGIN YES DATA ============================== Login");

          NAMEUSER = dataList[0]['name'];
          EMAILUSER = dataList[0]['email'];
          PASSWORDUSER = dataList[0]['password'];



          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString("NAMEUSER",NAMEUSER);
          sharedPreferences.setString("EMAILUSER",EMAILUSER);
          sharedPreferences.setString("PASSWORDUSER",PASSWORDUSER) ;

           Navigator.of(context).pushNamedAndRemoveUntil('StepOne', (route) => false);

        }

        else{
          Navigator.pop(context);
          // showSnakBar("${getinfo.error?.message}",);
          showSnakBar("Die Internetverbindung ist sehr langsam");

        }



      }



    }

  }


  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xff373e98),),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.network("https://i.imgur.com/OtoorWN.jpg",fit: BoxFit.fill),
            Center(
              child  : Container(
                width: PlatFormServices.isMobile(context)  ? width * 0.9 : width * 0.7,
                height: height * 0.9,
                padding: const EdgeInsetsDirectional.only(start: 20,end: 20),
                decoration:  BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child:SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network("https://i.imgur.com/v3uXEGM.png",height: height* 0.3,width: width,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 330,
                          child: Text("Email",style: TextStyle(fontSize: 25,fontFamily: "Satisfy-Regular"),),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 350,
                          child:   buildemail(),
                        ),
                        const SizedBox(height: 15),

                         const SizedBox(
                          width: 330,
                          child: Text("Password",style: TextStyle(fontSize: 25,fontFamily: "Satisfy-Regular"),),
                         ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 350,
                          child:  buildpass(),
                        ),

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PlatFormServices.isMobile(context) ?  const Text("Do you  have't an account?", style: TextStyle(fontWeight: FontWeight.bold,fontSize:10,fontFamily: "Lemonada"))
                            :
                            const Text("Do you  have't an account?", style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,fontFamily: "Lemonada"),

                          ),
                            TextButton(
                              onPressed: () {   Navigator.push(context, MaterialPageRoute(
                                  builder:(_) =>   const Register()));
                              },
                              child:PlatFormServices.isMobile(context) ?  Text(
                                'Register',
                                style: TextStyle(fontSize:11,color: Colors.blue.shade900,fontFamily: "Lemonada",fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                              ) :Text(
                                'Register',
                                style: TextStyle(fontSize:16,color: Colors.blue.shade900,fontFamily: "Lemonada",fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        buldbuttonlogin(),
                      ],
                    ),

                  ],
                ),),
              ),

            ),
          ],
        ),
      ),
    );
  }


  Widget buildemail() => TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: email,
    style: const TextStyle(color: Colors.white),

    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2.5,
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: GradientOutlineInputBorder(
        width: 3.0,
        borderRadius: BorderRadius.circular(20),
        gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green.shade800,
              Colors.green.shade800,
            ]),
      ),
      prefixIcon: const Icon(Icons.email_rounded, color: Colors.white),
      filled: true,
      fillColor: Colors.black.withOpacity(0.5), // const Color.fromRGBO(25, 25, 25, 45),
    ),
  );
  Widget buildpass() => TextFormField(
    keyboardType: TextInputType.visiblePassword,
    style: const TextStyle(color: Colors.white),
    controller: pass,
    obscureText: _showPass,
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
        gradient:  LinearGradient(
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
      onPressed:signIn,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      splashColor: const Color.fromRGBO(30, 30, 30, .51),
      child: const Text(
        'Log in',
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

