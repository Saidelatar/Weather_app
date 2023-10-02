import 'package:weatherapp/models/weather_model.dart';

class WeatherStates {}

class NoWeather extends WeatherStates {}

class WeatherLoadedSuccessful extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedSuccessful(this.weatherModel);

}

class WeatherLoadedFauilre extends WeatherStates {
  
}
