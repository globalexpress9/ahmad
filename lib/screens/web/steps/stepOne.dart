
import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constant.dart';
import '../../../distance.dart';
import '../../HomeWeb/Services/PlatformServices.dart';


class StepOne extends StatefulWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  State<StepOne> createState() => _StepOneState();
}



class _StepOneState extends State<StepOne> {

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




  Future<List<String>> loadCountrys() async {

    try{
      final String response =   await rootBundle.loadString('assets/city.json'); //await rootBundle.loadString('city.json');
      final respons = await jsonDecode(response);
      Data.data = respons;
      String a = "" ;
      a=Data.data[0]['city'];
      for(int i = 0 ; i+1 < Data.data.length ; i++) {
        if(Data.data[i]['city'] == a)
        {continue;}
        Data.selectCityOwnListSearch.add(Data.data[i]['city'].toString());
        a=Data.data[i]['city'].toString();
      }

    }catch(e){showSnakBar("Oops! Loading Citys ---");
    }

    return   Data.selectCityOwnListSearch ;

  }













  getDistanceService()async{
    Data.totalPrice=0;

    String latCity1="";
    String lonCity1="";
    String latCity2="";
    String lonCity2="";

    Data.totalPrice+=Data.pricSelectRadioButton;


    if(Data.selectCheckbox[0]==true)
    {Data.totalPrice+=25 ;}
    if(Data.selectCheckbox[1]==true)
    {Data.totalPrice+=25 ;}

    calcpercent(Data.totalPrice);

    if(Data.selectCityOwn == "" || Data.selectCityTow == "") {
      return;
    }


    bool findCity1 = false;
    bool findCity2 = false;
    int a = 0;
    for(int i = 0 ; i < Data.data.length ; i++) {

      if(!findCity1)
        {if(Data.data[i]['city'] == Data.selectCityOwn){
            latCity1 = Data.data[i]['lat'].toString();
            lonCity1 = Data.data[i]['lon'].toString();
            findCity1=true;
            a++;
          }}

      if(!findCity2)
        {if(Data.data[i]['city'] == Data.selectCityTow){
          latCity2 = Data.data[i]['lat'].toString();
          lonCity2 = Data.data[i]['lon'].toString();
             findCity2=true;
             a++;
           }}

      if(a==2) {
        break;
      }

    }




    double dec = await DistanceService.des(latCity1,lonCity1,latCity2,lonCity2);

    // add 35 %
    double da = (dec*30)/100 + dec;
    
    //
    int decc = da.toInt();

    Data.dectanceKm = decc;


    if(decc<=20){
      Data.totalPrice+= 20;
    }
    else if(decc<=50)
    {
      int km =  50 - decc ;
      Data.totalPrice = Data.totalPrice + (2 * km );
    }
    else if(decc<=100)
    {
      int km =  100 - decc ;
      Data.totalPrice = Data.totalPrice + (1.5 * km );
    }
    else if(decc>100)
    {
      int km = decc ;//- 100  ;
      Data.totalPrice = Data.totalPrice + (1 * km );
    }

    calcpercent(Data.totalPrice);
  }

  goToStepTow(){
    if(Data.pricSelectRadioButton==0){
      showSnakBar("Wählen Sie den Fahrzeugtyp aus");
      return;
    }
    if(Data.dectanceKm==0){
      showSnakBar("Regionen auswählen");
      return;
    }
    if(Data.totalPrice == 0) {return;}
    Navigator.of(context).pushNamedAndRemoveUntil('StepThird', (route) => false);
  }

  calcpercent(double t){

    Data.percentPrice=0;
    Data.totPrice = t;





    Data.percentPrice = (t * 19) / 100 ;
    String s = Data.percentPrice.toStringAsFixed(3);
    Data.percentPrice = double.parse(s);

    Data.totPrice += Data.percentPrice;

    String ss = Data.totPrice.toStringAsFixed(3);
    Data.totPrice = double.parse(ss);


    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCountrys();
  }

  // PlatFormServices.isMobile(context)

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: [
        Image.network("https://images.pexels.com/photos/2199293/pexels-photo-2199293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",fit: BoxFit.fill),
          PlatFormServices.isMobile(context) ?
          Center(
          child: Container(
            width: width * 0.9,
            height: height * 0.95,
            decoration:  BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),

            padding:   EdgeInsetsDirectional.only(top: height * 0.03 , start: width * 0.02),
            child: SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      SizedBox(width: width * 0.04 + 40),
                      const Text("Autogrößen",style: TextStyle(fontSize: 14,fontFamily: "Lemonada"),),
                      SizedBox(width : width * 0.09+20),
                      const Text("Autogewichte",style: TextStyle(fontSize: 14,fontFamily: "Lemonada"),),
                    ],
                  ),
                  SizedBox(height: height * 0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          focusColor: Colors.green.shade800,
                          hoverColor: Colors.green.shade200,
                          activeColor:  Colors.green.shade800,
                          value: Data.selectRadioButton[0],
                          groupValue: 1,
                          onChanged: (e){
                            Data.selectRadioButton = [0,0,0,0];
                            Data.selectRadioButton[0] = 1;
                            Data.pricSelectRadioButton = 44;
                            getDistanceService();
                            calcpercent(Data.totalPrice);

                          }
                      ),
                      SizedBox(width : width * 0.03),
                      const Text("160 x 125 x 125 cm",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                      SizedBox(width : width * 0.07+15),
                      const Text("Max 400kg",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          focusColor: Colors.green.shade800,
                          hoverColor: Colors.green.shade200,
                          activeColor:  Colors.green.shade800,
                          value: Data.selectRadioButton[1],
                          groupValue: 1,
                          onChanged: (e){
                            Data.selectRadioButton = [0,0,0,0];
                            Data.selectRadioButton[1] = 1;
                            Data.pricSelectRadioButton = 64;
                            getDistanceService();
                            calcpercent(Data.totalPrice);
                          }
                      ),
                      SizedBox(width : width * 0.03),
                      const Text(" 320  x 130 x 150 cm",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                      SizedBox(width : width * 0.07),
                      const Text("Max 800kg",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          focusColor: Colors.green.shade800,
                          hoverColor: Colors.green.shade200,
                          activeColor:  Colors.green.shade800,
                          value: Data.selectRadioButton[2],
                          groupValue: 1,
                          onChanged: (e){
                            Data.selectRadioButton = [0,0,0,0];
                            Data.selectRadioButton[2] = 1;
                            Data.pricSelectRadioButton = 109;
                            getDistanceService();
                            calcpercent(Data.totalPrice);}

                      ),
                      SizedBox(width : width * 0.03),
                      const Text(" 420  x 130 x 185 cm",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                      SizedBox(width : width * 0.07),
                      const Text("Max 1200kg",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          focusColor: Colors.green.shade800,
                          hoverColor: Colors.green.shade200,
                          activeColor:  Colors.green.shade800,
                          value: Data.selectRadioButton[3],
                          groupValue: 1,
                          onChanged: (e){
                            Data.selectRadioButton = [0,0,0,0];
                            Data.selectRadioButton[3] = 1;
                            Data.pricSelectRadioButton = 169;
                            getDistanceService();
                            calcpercent(Data.totalPrice);
                          }
                      ),
                      SizedBox(width : width * 0.03),
                      const Text(" 480  x 210 x 210 cm",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                      SizedBox(width : width * 0.07),
                      const Text("Max 800kg",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),

                    ],
                  ),
                  SizedBox(height: height*0.025),

                  const SizedBox(
                    width: 280,
                    child:Text("Lade Zone",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                  ),
                  SizedBox(
                    width: 280,
                    child: DropdownSearch<String>(
                      enabled: true,
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                      ),
                      items: Data.selectCityOwnListSearch,
                      onChanged: (e) async {
                        Data.totalPrice=0;
                        Data.selectCityOwn = e.toString();
                        getDistanceService();
                      },
                      selectedItem: Data.selectCityOwn,

                    ),
                  ),
                  SizedBox(height : height * 0.012),

                  const SizedBox(
                    width: 280,
                    child:Text("Entladungsbereich",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                  ),
                  SizedBox(
                    width: 280,
                    child:DropdownSearch<String>(
                      enabled: true,
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                      ),
                      items: Data.selectCityOwnListSearch,
                      onChanged: (e) async {
                        Data.totalPrice=0;
                        Data.selectCityTow = e.toString();
                        getDistanceService();
                      },
                      selectedItem: Data.selectCityTow,


                    ),
                  ),
                  SizedBox(height: height*0.005),
                  Data.dectanceKm == 0 ? const Text(""): Text("Distanz : ${Data.dectanceKm} km",style: const TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                 SizedBox(height: height*0.028),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        focusColor: Colors.green.shade800,
                        hoverColor: Colors.green.shade200,
                        activeColor:  Colors.green.shade800,

                        value: Data.selectCheckbox[0],
                        onChanged: (bool? value) {
                          setState(() {
                            Data.selectCheckbox[0] = !  Data.selectCheckbox[0];
                            getDistanceService();
                          });
                        },
                      ),
                     const Text("Beladehilfe durch Fahrer (+25.00 EUR)",style: TextStyle(fontSize: 12,fontFamily: "Lemonada"),),
                    ],
                  ),
                  SizedBox(height : height * 0.0075),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        focusColor: Colors.green.shade800,
                        hoverColor: Colors.green.shade200,
                        activeColor:  Colors.green.shade800,

                        value: Data.selectCheckbox[1],
                        onChanged: (bool? value) {
                          setState(() {
                            Data.selectCheckbox[1] = !  Data.selectCheckbox[1];
                            getDistanceService();
                          });
                        },
                      ),
                      const Text("Entladehilfe durch Fahrer (+25.00 EUR)",style: TextStyle(fontSize: 12,fontFamily: "Lemonada"),),
                    ],
                  ),
                 const SizedBox(height: 20),
                 //  SizedBox(height : height * 0.008),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(

                        decoration: BoxDecoration(
                          color: Colors.green.shade800.withOpacity(0.5),

                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        padding:  const EdgeInsetsDirectional.all(10),
                        margin: const EdgeInsetsDirectional.only(start:  20, end: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Gesamtzahlung : ${Data.totalPrice} EUR" , style: const TextStyle(height: 1,fontSize: 15,fontFamily: "Lemonada")),
                            const SizedBox(height: 10),
                            Text("19% : ${Data.percentPrice} EUR MwSt" , style: const TextStyle(height: 1,fontSize: 12,fontFamily: "Lemonada")),
                            const SizedBox(height: 10),
                            Text("Brutto Betrag: ${Data.totPrice} EUR" , style: const TextStyle(height: 1,fontSize: 12,fontFamily: "Lemonada")),


                          ],
                        ) ),

                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed:goToStepTow ,
                        color: Colors.green.shade800,
                        iconSize: 35,
                        icon: const Icon(Icons.arrow_forward),),


                    ],
                  ),

                ],
              ),
            ),
          ),
        ):
          Center(
            child: Container(
              width: width * 0.5,
              height: height * 0.97,
              decoration:  BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),

              padding:   EdgeInsetsDirectional.only(top: height * 0.05 , start: width * 0.02),
              child: SingleChildScrollView(
                child:Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(

                      children:  [
                        SizedBox(width: width * 0.04 + 20),
                        const Text("Autogrößen",style: TextStyle(fontSize: 20,fontFamily: "Lemonada"),),
                        SizedBox(width : width * 0.08),
                        const Text("Autogewichte",style: TextStyle(fontSize: 20,fontFamily: "Lemonada"),),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(

                      children: [
                        Radio(
                            focusColor: Colors.green.shade800,
                            hoverColor: Colors.green.shade200,
                            activeColor:  Colors.green.shade800,
                            value: Data.selectRadioButton[0],
                            groupValue: 1,
                            onChanged: (e){
                              Data.selectRadioButton = [0,0,0,0];
                              Data.selectRadioButton[0] = 1;
                              Data.pricSelectRadioButton = 44;
                              getDistanceService();
                              calcpercent(Data.totalPrice);

                            }
                        ),
                        SizedBox(width : width * 0.03),
                        const Text("160 x 125 x 125 cm",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                        SizedBox(width : width * 0.07+15),
                        const Text("Max 400kg",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                      ],
                    ),
                    Row(
                      children: [

                        Radio(
                            focusColor: Colors.green.shade800,
                            hoverColor: Colors.green.shade200,
                            activeColor:  Colors.green.shade800,
                            value: Data.selectRadioButton[1],
                            groupValue: 1,
                            onChanged: (e){
                              Data.selectRadioButton = [0,0,0,0];
                              Data.selectRadioButton[1] = 1;
                              Data.pricSelectRadioButton = 64;
                              getDistanceService();
                              calcpercent(Data.totalPrice);
                            }
                        ),
                        SizedBox(width : width * 0.03),
                        const Text(" 320  x 130 x 150 cm",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                        SizedBox(width : width * 0.07),
                        const Text("Max 800kg",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                      ],
                    ),
                    Row(

                      children: [
                        Radio(
                            focusColor: Colors.green.shade800,
                            hoverColor: Colors.green.shade200,
                            activeColor:  Colors.green.shade800,
                            value: Data.selectRadioButton[2],
                            groupValue: 1,
                            onChanged: (e){
                              Data.selectRadioButton = [0,0,0,0];
                              Data.selectRadioButton[2] = 1;
                              Data.pricSelectRadioButton = 109;
                              getDistanceService();
                              calcpercent(Data.totalPrice);}

                        ),
                        SizedBox(width : width * 0.03),
                        const Text(" 420  x 130 x 185 cm",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                        SizedBox(width : width * 0.07),
                        const Text("Max 1200kg",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                      ],
                    ),
                    Row(

                      children: [
                        Radio(
                            focusColor: Colors.green.shade800,
                            hoverColor: Colors.green.shade200,
                            activeColor:  Colors.green.shade800,
                            value: Data.selectRadioButton[3],
                            groupValue: 1,
                            onChanged: (e){
                              Data.selectRadioButton = [0,0,0,0];
                              Data.selectRadioButton[3] = 1;
                              Data.pricSelectRadioButton = 169;
                              getDistanceService();
                              calcpercent(Data.totalPrice);
                            }
                        ),
                        SizedBox(width : width * 0.03),
                        const Text(" 480  x 210 x 210 cm",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                        SizedBox(width : width * 0.07),
                        const Text("Max 800kg",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),

                      ],
                    ),
                    SizedBox(height: height*0.03),

                    const SizedBox(
                      width: 350,
                      child:Text("Lade Zone",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    SizedBox(
                      width: 350,
                      child: DropdownSearch<String>(
                        enabled: true,
                        popupProps: const PopupProps.menu(
                          showSearchBox: true,
                          showSelectedItems: true,
                        ),
                        items: Data.selectCityOwnListSearch,
                        onChanged: (e) async {
                          Data.totalPrice=0;
                          Data.selectCityOwn = e.toString();
                          getDistanceService();
                        },
                        selectedItem: Data.selectCityOwn,

                      ),
                    ),
                    SizedBox(height : height * 0.02),

                    const SizedBox(
                      width: 350,
                      child:Text("Entladungsbereich",style: TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    ),
                    SizedBox(
                      width: 350,
                      child:DropdownSearch<String>(
                        enabled: true,
                        popupProps: const PopupProps.menu(
                          showSearchBox: true,
                          showSelectedItems: true,
                        ),
                        items: Data.selectCityOwnListSearch,
                        onChanged: (e) async {
                          Data.totalPrice=0;
                          Data.selectCityTow = e.toString();
                          getDistanceService();
                        },
                        selectedItem: Data.selectCityTow,


                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Data.dectanceKm == 0 ? const Text(""): Text("Distanz : ${Data.dectanceKm} km",style: const TextStyle(fontSize: 15,fontFamily: "Lemonada"),),
                    SizedBox(height: height*0.028),
                    Row(

                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          focusColor: Colors.green.shade800,
                          hoverColor: Colors.green.shade200,
                          activeColor:  Colors.green.shade800,

                          value: Data.selectCheckbox[0],
                          onChanged: (bool? value) {
                            setState(() {
                              Data.selectCheckbox[0] = !  Data.selectCheckbox[0];
                              getDistanceService();
                            });
                          },
                        ),
                        const Text("Beladehilfe durch Fahrer (+25.00 EUR)",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                      ],
                    ),
                    SizedBox(height : height * 0.008),
                    Row(

                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          focusColor: Colors.green.shade800,
                          hoverColor: Colors.green.shade200,
                          activeColor:  Colors.green.shade800,

                          value: Data.selectCheckbox[1],
                          onChanged: (bool? value) {
                            setState(() {
                              Data.selectCheckbox[1] = !  Data.selectCheckbox[1];
                              getDistanceService();
                            });
                          },
                        ),
                        const Text("Entladehilfe durch Fahrer (+25.00 EUR)",style: TextStyle(fontSize: 11,fontFamily: "Lemonada"),),
                      ],
                    ),
                    //  SizedBox(height : height * 0.008),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(

                            decoration: BoxDecoration(
                              color: Colors.green.shade800.withOpacity(0.5),

                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                            ),
                            padding:  const EdgeInsetsDirectional.all(10),
                            margin: const EdgeInsetsDirectional.only(start:  20, end: 50),
                            child: Column(
                              children: [
                                Text("Gesamtzahlung : ${Data.totalPrice} EUR" , style: const TextStyle(height: 1,fontSize: 15,fontFamily: "Lemonada")),
                                const SizedBox(height: 10),
                                Text("19% : ${Data.percentPrice} EUR MwSt" , style: const TextStyle(height: 1,fontSize: 12,fontFamily: "Lemonada")),
                                const SizedBox(height: 10),
                                Text("Brutto Betrag :  ${Data.totPrice} EUR" , style: const TextStyle(height: 1,fontSize: 12,fontFamily: "Lemonada")),


                              ],
                            ) ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed:goToStepTow ,
                          color: Colors.green.shade800,
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_forward),),


                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),

      ],)

    );
  }


}
