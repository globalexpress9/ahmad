
import 'package:geolocator/geolocator.dart';

class DistanceService{





 static des(String lat1 , String lng1 , String lat2,String lng2){



    double lt1 = double.parse(lat1);
    double lg1 =double.parse(lng1);
    double lt2 =double.parse(lat2);
    double lg2 =double.parse(lng2); // 8.85167; // toRadian(to.longitude);

    print(lat1.runtimeType);

    double distanceBetweenCity= Geolocator.distanceBetween(lt1, lg1, lt2, lg2);
    distanceBetweenCity = distanceBetweenCity/1000; // km
    print("======================");
    print("distanceBetweenCity :  $distanceBetweenCity" );

return distanceBetweenCity;


    //
    // var p = 0.017453292519943295;
    // var c = cos;
    // var a = 0.5 - c((lat2 - lat1) * p)/2 +
    //     c(lat1 * p) * c(lat2 * p) *
    //         (1 - c((lng2 - lng1) * p))/2;
    // print("==================3");
    // print( 12742 * asin(sqrt(a)) );





  }














  // static double findDistance(){//LatLng from, LatLng to
  //   var lat1 = 50.77556 ; //toRadian(from.latitude);
  //   var lng1 =6.08361 ;// toRadian(from.longitude);
  //   var lat2 =47.84556; // toRadian(to.latitude);
  //   var lng2 =8.85167; // toRadian(to.longitude);
  //
  //   // Haversine Formula
  //   var dlong = lng2 - lng1;
  //   var dlat = lat2 - lat1;
  //
  //   var res = pow(sin((dlat / 2)), 2) + cos(lat1) * cos(lat2) * pow(sin(dlong / 2), 2);
  //   res = 2 * asin(sqrt(res));
  //   double R = 6371;
  //   res = res * R;
  //   print("pp");
  //   print(res);
  //   return res;
  // }
  //
  // static double toRadian(double val){
  //   double one_deg = (pi) / 180;
  //   return (one_deg * val);
  // }
}
