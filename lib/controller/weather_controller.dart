import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_forecast/model/models.dart';
import 'package:weather_forecast/services/location_services.dart';
import 'package:weather_forecast/services/weather_services.dart';

late WeatherController controller;

class WeatherController extends GetxController {
  var weatherDetails = WeatherDetails().obs;
  var receivedData = false.obs;

  @override
  void onInit() {
    super.onInit();
    getWeatherData();
  }

  getWeatherData() async {
    WeatherServices services = WeatherServices();
    LocationServices locationServices = LocationServices();
    Position position = await locationServices.getLocation();
    try {
      weatherDetails.value = await services.fetchWeather(
        lat: position.latitude.toString(),
        lon: position.longitude.toString(),
      );
      receivedData.value = true;
      receivedData.refresh();
    } catch (e) {
      Get.snackbar('Failed attempt', 'Failed to fetch weather data');
    }
  }
}
