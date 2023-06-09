import 'package:weather/services/networking.dart';
import 'package:weather/services/location.dart';

const apiKey = '4ad92b6452d93944c955664de2837049';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{

    //String url ='https://api.openweathermap.org/data/2.5/weather?city=$cityName&appid=$apiKey';
    String url = 'https://hom.academy/weather.php';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var data = await networkHelper.getData();

    return data;

  }
  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    double longitude = location.longitude;
    double latitude = location.latitude;

    //  String url ='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    String url = 'https://hom.academy/weather.php';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var data = await networkHelper.getData();

    return data;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}