import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  static const String apiKey = '4ad92b6452d93944c955664de2837049';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    double longitude = location.longitude;
    double latitude = location.latitude;

  //  String url ='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    String url = 'https://hom.academy/weather.php';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var data = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: data,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}